FROM python:3 AS pybuild

WORKDIR /root

COPY . .

# run python script to download latest server file:
RUN ["pip", "install", "requests"]
RUN ["python3", "getlatestjar.py"]

FROM openjdk:8 AS javabuild

WORKDIR /root

COPY --from=pybuild /root .

# expose the port
EXPOSE $PORT:$PORT

# set the minecraft server port to the port exposed in
# this container
RUN ./setport.sh $PORT

# set the world name
RUN ./setworld.sh $WORLD

CMD ["./start.sh"]