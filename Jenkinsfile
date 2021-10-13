#!groovy

def cmdline1 ="./build.sh"
def cmdline2 ="./launch.sh"
def cmdline3 ="./push.sh"
pipeline {
    
  agent { label 'master'
        }

  stages {

    stage('Build image') {
        /* This builds the actual image; synonymous to
         * docker build on the command line */
        steps{
           withCredentials([usernamePassword(credentialsId: GIT_RESTFUL, passwordVariable: 'PWD', usernameVariable: 'USER')]){
            script { 
                cmdline1 = "chmod +x -R ${env.WORKSPACE}; "
                cmdline1 = cmdline1 + ' -u ' + "${USER}:${PWD}"
                sh (script: cmdline1)
                
            }
        }
        }
    }

    stage('Test image') { 
        /* Ideally, we would run a test framework against our image.
         * For this example, we're using a Volkswagen-type approach ;-) */

        steps {
            script{  sh ''' ./launch.sh -u ysunou:7+rose ''' }
        }
    }

    stage('Push image') {
        /* Finally, we'll push the image with two tags:
         * First, the incremental build number from Jenkins
         * Second, the 'latest' tag.
         * Pushing multiple tags is cheap, as all the layers are reused. */
        steps{ 
            script { 
                sh ''' ./push.sh ''' 
            } 
        }
    }
  }
} 
