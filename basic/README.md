# How to start Laravel Homepage
* build docker image with `docker build -t nginx-sample:latest .`
* run docker container with `docker run -itd -p --name nginx --rm 80:3000 nginx-sample:latest`
* open http://localhost:3000

Please refer to `Dockerfile`  in this folder for more information.

# Dumping mysql database
* Simply run `./dump.sh <password> <port>`
* Then script will run docker container with mysql 5.7.x and import sample database in the folder called `sqls`
* Starting dumping databases in this container
* Delete files that created over 10 days in backup folder
* Automatically stop mysql container.

See `dump.sh` for more info.