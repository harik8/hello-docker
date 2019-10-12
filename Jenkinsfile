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
        stage("publish") {
            steps {
                container(name: 'kaniko', shell: '/busybox/sh') {
                     withEnv(['PATH+EXTRA=/busybox:/kaniko']) {
                      sh """#!/busybox/sh
                      /kaniko/executor --context=$WORKSPACE --destination $dockerImage:$release 
                      """
                     }
                }
            }
        }
    }
}
