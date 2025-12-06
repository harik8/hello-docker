<p align="center">
  <img src="./asserts/hello-docker.png" width="200" />
  [![CICD](https://github.com/harik8/hello-docker/actions/workflows/main.yaml/badge.svg?branch=D-051225)](https://github.com/harik8/hello-docker/actions/workflows/main.yaml)![DOCKER PULLS](https://img.shields.io/docker/pulls/harik8/hello-docker)
</p>

[![CICD](https://github.com/harik8/hello-docker/actions/workflows/main.yaml/badge.svg?branch=D-051225)](https://github.com/harik8/hello-docker/actions/workflows/main.yaml)![DOCKER PULLS](https://img.shields.io/docker/pulls/harik8/hello-docker)

The hello-docker is a containerized web app, which serves a simple html page as shown above.
It's handy for learning and testing purposes.  

# Usage

Docker

```docker run -p 8080:80 harik8/hello-docker```

Kubernetes

```kubectl run hello-docker --image=harik8/hello-docker --restart=Never```

