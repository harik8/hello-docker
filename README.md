# hello-docker [![Build Status](https://travis-ci.org/hariyaa/hello-docker.svg?branch=master)](https://travis-ci.org/hariyaa/hello-docker)

hello-docker is a sample docker app. Which can be used for container tests. It builds a simple html web page on top of nginx.
Images are available in dockerhub. 

Docker usage

```docker pull harikarthi/hello-docker```

Kubernetes usage

```kubectl run hello-docker --image=harikarthi/hello-docker --restart=Never```

