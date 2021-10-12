#!groovy

pipeline {
    
  agent { label 'master'
        }
  options {
     buildDiscarder(logRotator (numToKeepStr:  '10', daysToKeepstr: '20'))
     timestamps()
     timeout(time: 12, unit: 'HOURS')
  }
  stages {

    stage('Build image') {
        /* This builds the actual image; synonymous to
         * docker build on the command line */
        steps{
            script { sh ''' ./build.sh ''' }
        }
    }

    stage('Test image') { 
        /* Ideally, we would run a test framework against our image.
         * For this example, we're using a Volkswagen-type approach ;-) */

        steps {
            script{  sh ''' ./launch.sh ''' }
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
