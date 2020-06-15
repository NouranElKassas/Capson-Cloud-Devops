
pipeline {
  agent {
    dockerfile true
  }
  stages {
    stage('Lint HTML.') {
      steps {
        sh 'tidy -q -e *.html'
      }
    }

    stage('Upload to AWS.') {
      steps {
        withAWS(region: 'us-east-2', credentials: 'Nour') {
          s3Upload(file: 'generate.html', bucket: 'nouran.portfolio', path: 'generate.html')
        }

        sh 'echo "Hello World"'
        sh '''
                        echo "Multiline shell steps works too"
                        ls -lah
                    '''
      }
    }

  }
}
