#!groovy

def cmdline1 ="./build.sh"
def cmdline2 ="./run.sh"
def cmdline3 ="./launch.sh"
def cmdline4 ="./push.sh"
pipeline {
    
  agent { label 'master'
        }

  stages {

    stage('Build image') {
        /* This builds the actual image; synonymous to
         * docker build on the command line */
        steps{
            script { 
                sh "chmod +x -R ${env.WORKSPACE}"
                sh (script: cmdline1)
                
            }
        }
    }

    stage('Run image') { 
        /* Ideally, we would run a test framework against our image.
         * For this example, we're using a Volkswagen-type approach ;-) */

        steps {
             sh "chmod +x -R ${env.WORKSPACE}"
             sh (script: cmdline2)
        }
    }

    stage('Test image') {
        /* Finally, we'll push the image with two tags:
         * First, the incremental build number from Jenkins
         * Second, the 'latest' tag.
         * Pushing multiple tags is cheap, as all the layers are reused. */
        steps{ 
            script { 
                sh "chmod +x -R ${env.WORKSPACE}"
                sh (script: cmdline3)
            } 
        }
    }
      stage('Push image') {
        /* Finally, we'll push the image with two tags:
         * First, the incremental build number from Jenkins
         * Second, the 'latest' tag.
         * Pushing multiple tags is cheap, as all the layers are reused. */
        steps{ 
            script { 
                sh "chmod +x -R ${env.WORKSPACE}"
                sh (script: cmdline4)
            } 
        }
    }
  }
} 
