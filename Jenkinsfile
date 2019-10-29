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

    stages {
        stage("lint") {
            steps {
                container("hadolint") {
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
                    sh  "CLAIR_ADDR=http://clair-clair.clair.svc:6060 CLAIR_OUTPUT=Low CLAIR_THRESHOLD=10 klar $registry:$tag"
                }
            }
        }
    }
}

