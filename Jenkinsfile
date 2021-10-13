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
            script { 
                sh (script: cmdline1)
                
            }
        }
    }

    stage('Test image') { 
        /* Ideally, we would run a test framework against our image.
         * For this example, we're using a Volkswagen-type approach ;-) */

        steps {
             sh (script: cmdline2)
        }
    }

    stage('Push image') {
        /* Finally, we'll push the image with two tags:
         * First, the incremental build number from Jenkins
         * Second, the 'latest' tag.
         * Pushing multiple tags is cheap, as all the layers are reused. */
        steps{ 
            script { 
                 sh (script: cmdline3)
            } 
        }
    }
  }
} 
