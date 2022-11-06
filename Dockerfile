FROM python:3 AS pybuild

WORKDIR /root

COPY . .

# run python script to download latest server file:
RUN ["pip", "install", "requests"]
RUN ["python3", "getLatestJar.py"]

FROM openjdk:17 AS javabuild

ARG PORT

WORKDIR /root

COPY --from=pybuild /root .

RUN ls

# expose the port
EXPOSE $PORT:$PORT

# set the minecraft server port to the port exposed in
# this container
RUN ./setport.sh $PORT

CMD ["./start.sh"]