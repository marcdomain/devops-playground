# USING DOCKER & BASH TO CREATE 3 CONTAINERS

### Using bash script, Write a script that will automatically provision 3 docker containers running kibana version 6.4.2, nginx server, mysql server separately on each container. The containers should be able to ping each other

- I used `docker-compose.yml` to run the three containers. Docker compose helps to provide a quick overview and better maintainability of the docker containers. Also, using docker-compose to create containers helps to keep the containers in the same network. Hence the containers would be able to ping one another. However, I decided to create a network in this case, for easy identification.

- The implementation can also be done without the use of a docker-compose.yml file. The bash script in `create_containers.sh` would produce same result as the docker-compose file. Whenever a docker container is created, it will be randomly added to one of the default docker networks and driver. So, there is a likelihood that a multi-container may not all exist in the same network. Hence I created a network in the bash script and ensured the three containers are running on it. This unsures that the three containers can ping one another.

### Setup

- Setup with docker-compose

```bash
  $ cd docker
```

```bash
  $ docker-compose up
```

- Setup with bash script

```bash
  $ bash create_containers.sh
```

Either of the options above will create the three containers **(marc_server, marc_kibana, and marc_mysql_database)**

- Pinging containers

```bash
  $ docker exec -it <container name> bash
```

```bash
  $ ping <another container name>
```

### View the running containers in browser

- NGINX address (localhost:8030)
- KIBANA address (localhost:5601)
