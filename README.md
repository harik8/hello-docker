# hello-docker [![Build Status](https://travis-ci.com/harik8/hello-docker.svg?branch=master)](https://travis-ci.com/harik8/hello-docker)

hello-docker is a sample docker app. Which can be used for container tests. It builds a simple html web page on top of nginx.
Images are available in dockerhub. 

Docker usage

```docker pull harik8/hello-docker```

Kubernetes usage

```kubectl run hello-docker --image=harik8/hello-docker --restart=Never```

