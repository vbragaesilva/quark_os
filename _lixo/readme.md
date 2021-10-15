# Dockertest
## Basics
To initialize the machine for development type:
``` 
$ docker-compose up -d
```
To end the machine:
``` 
$ docker-compose down
```

the ```-d``` runs the machine in the background, removing it makes the current terminal "running" it until Ctrl+C cancels it. Note that Ctrl+C doesn't makes the machine down.

You can see the up machines using:
```
$ docker-compose ps
or
$ docker ps
```
