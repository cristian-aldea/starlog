# Docker

- [Docker](#docker)
  - [Building the image](#building-the-image)
  - [Running the image](#running-the-image)
  - [Pushing the images](#pushing-the-images)

## Building the image

To build the image for the project in this repository, run the following:

```bash
# Build using local public/
hugo
docker build -f docker/Dockerfile -t cristianaldea/starlog:latest .
```

## Running the image

```bash
docker run -p 8080:80 cristianaldea/starlog:latest
```

## Pushing the images

```bash
docker push cristianaldea/starlog:latest
```
