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
    
    stage('Clone repository') {
        /* Let's make sure we have the repository cloned to our workspace */
        
    }

    stage('Build image') {
        /* This builds the actual image; synonymous to
         * docker build on the command line */
        sh ''' ./build.sh '''
    }

    stage('Test image') { 
        /* Ideally, we would run a test framework against our image.
         * For this example, we're using a Volkswagen-type approach ;-) */

        app.inside {
            sh ''' ./launch.sh '''
        }
    }

    stage('Push image') {
        /* Finally, we'll push the image with two tags:
         * First, the incremental build number from Jenkins
         * Second, the 'latest' tag.
         * Pushing multiple tags is cheap, as all the layers are reused. */
        sh ''' ./push.sh '''
    }
  }
} 
