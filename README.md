# Client building environment of the front end of T.A.P 

[![Docker Automated build](https://img.shields.io/docker/automated/jrottenberg/ffmpeg.svg)](https://hub.docker.com/r/gerardojunior/tap.client.environment)

Docker image to run [nuxt.js](nuxtjs.org) projects

> The project must be in the **/usr/local/src** folder and will be available on port **:3000** of the container

## Tags available

- stable
  - node 8.11.1 (carbon)
  - yarn 1.5.1
- latest
  - node 8.11.1 (carbon)
  - yarn 1.5.1

## Installing

```bash
docker pull gerardojunior/tap.client.environment
```
## How to build

to build the image you need install the [docker engine](https://www.docker.com/) only

```bash
git clone https://github.com/gerardo-junior/tap.client.environment.git
cd tap.client.environment
docker build . --tag gerardojunior/tap.client.environment
```

## how to use

### Only with docker command:

```bash
# in your project folder
docker run -v $(pwd):/usr/share/src -p 3000:3000 gerardojunior/tap.client.environment [nuxt command or sh command]
```
### With [docker-compose](https://docs.docker.com/compose/)

Create the docker-compose.yml file  in your project folder with:

```yml
# (...)

  nuxt:
    image: gerardojunior/tap.client.environment:stable
    restart: on-failure
    volumes:
      - type: bind
        source: ./
        target: /usr/share/src
    ports:
      - 3000:3000
    command: [nuxt command]

# (...)
```

## How to enter image shell
 
```bash
docker run -it --rm gerardojunior/tap.client.environment /bin/sh
# or with docker-compose
docker-compose exec nuxt /bin/sh
```

### License  
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details