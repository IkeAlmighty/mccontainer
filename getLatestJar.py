import requests, json, datetime, re, urllib.request

metadata = requests.get('https://launchermeta.mojang.com/mc/game/version_manifest.json')

metajson = json.loads(metadata.content.decode())

# look for the latest version:
allversions = metajson['versions']

latestMetaData = (None, 0) # version dict, then timestamp
for version in allversions:
    if version['type'] != 'release': continue # only look at official releases
    dt_str = version['releaseTime']
    dp = re.split('[-T:+]', dt_str)
    dt = datetime.datetime(int(dp[0]), int(dp[1]), int(dp[2]), int(dp[3]), int(dp[4]), int(dp[5]))
    version_ts = dt.timestamp()

    if version_ts > latestMetaData[1]: latestMetaData = (version, version_ts)

releaseData = json.loads(requests.get(latestMetaData[0]['url']).content.decode())

urllib.request.urlretrieve(releaseData['downloads']['server']['url'], './server/server.jar')