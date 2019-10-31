// hello-docker

String image    = env.JOB_NAME.split('/')[1]
String registry = "harik8/$image"
String tag      = "latest"

pipeline {
    agent {
    kubernetes {
      	cloud 'kubernetes'
      	label 'hello-docker'
      	defaultContainer 'jnlp'
      	yamlFile 'pod.yaml'
      }
    }
    
    environment {
        DOCKER_CREDENTIALS=credentials("DOCKER_CREDENTIALS")
    }

    stages {
        stage("lint") {
            steps {
                container("lint") {
                    sh  "hadolint $WORKSPACE/Dockerfile"
                }
            }
        }

        stage("publish") {
            steps {
                container(name: 'kaniko', shell: '/busybox/sh') {
                     withEnv(['PATH+EXTRA=/busybox:/kaniko']) {
                      sh """#!/busybox/sh
                        /kaniko/executor --context=$WORKSPACE --destination $registry:$tag
                      """
                     }
                }
            }
        }

        stage("scan") {
            steps {
                container("klar") {
                    sh  """
                            CLAIR_ADDR=$CLAIR_ADDRESS \
                            CLAIR_OUTPUT=High \
                            CLAIR_THRESHOLD=1 \
                            DOCKER_USER=$DOCKER_CREDENTIALS_USR \
                            DOCKER_PASSWORD=$DOCKER_CREDENTIALS_PSW \
                            DOCKER_INSECURE=true \
                            klar $registry:$tag
                        """
                }
            }
        }
    }
}
