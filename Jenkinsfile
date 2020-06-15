
pipeline {
  environment {
    registry = "nouranelkassas/capstone"
    registryCredential = 'capstone'
  }
  agent any
  stages {
    stage('Lint HTML.') {
      steps {
        sh 'tidy -q -e *.html'
      }
    }
    stage('Build image') 
    {
      steps {
        sh 'docker build . -t nouranelkassas/capstone'
       }
     }
    stage('Deploy Image') {
      steps{    
         sh 'docker login -u=nouranelkassas -p=B3stfrinds;docker push nouranelkassas/capstone'
        }
    }
    
    stage('Deploy container') {
      steps {
        sh 'kubectl apply -f kubectl apply -f https://k8s.io/examples/controllers/nginx-deployment.yaml'
        sh 'kubectl get deployments'
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
