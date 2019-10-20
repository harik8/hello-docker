String[] buildElements = env.JOB_NAME.split('/')
String buildName = buildElements[buildElements.length - 2]
String registry = "harikarthi"
String dockerImage = "$registry/$buildName"
String release = "latest"

pipeline {
    agent {
        node {
            label "kaniko"
        }
    }

    stages {
        stage("lint") {
            steps {
                container("jnlp") {
                    sh  """
                            wget https://github.com/hadolint/hadolint/releases/download/v1.17.2/hadolint-Linux-x86_64 -O hadolint
                            chmod 0755 hadolint
                            ./hadolint $WORKSPACE/Dockerfile
                        """
                }
            }
        }
        stage("publish") {
            steps {
                container(name: 'kaniko', shell: '/busybox/sh') {
                     withEnv(['PATH+EXTRA=/busybox:/kaniko']) {
                      sh """#!/busybox/sh
                      /kaniko/executor --context=$WORKSPACE --destination harikarthi/hello-docker:latest --no-push
                      """
                     }
                }
            }
        }
        stage("scan") {
            steps {
                container("jnlp") {
                    sh  """
                            wget https://github.com/optiopay/klar/releases/download/v2.4.0/klar-2.4.0-linux-amd64 -O klar
                            chmod 0755 klar
                            CLAIR_ADDR=http://clair-clair.clair.svc:6060 CLAIR_OUTPUT=High CLAIR_THRESHOLD=10 ./klar harikarthi/hello-docker:latest
                        """
                }
            }
        }
    }
}

