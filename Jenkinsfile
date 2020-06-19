
pipeline {
  environment {
    registry = "nouranelkassas/capstone"
    registryCredential = 'capstone'
    GOCACHE = "/tmp"
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
        sh 'chmod +x run_kubernetes.sh'
      }
        }
    stage('Deploy Stack'){
      steps{
        //sh 'docker stack deploy --namespace capstone --compose-file docker-compose.yml mystack'
        //sh 'eksctl create cluster -f  cluster.yml --kubeconfig kubeconfig'
        sh 'sudo su -'
        sh 'sudo kubectl apply -f deployment.yaml'
        sh 'sudo kubectl apply -f service.yaml'
        sh 'sudo kubectl rollout status deployment.v1.apps/capstone'
        sh 'sudo kubectl get deployments'
        sh 'sudo kubectl get pods'
        sh 'sudo kubectl rollout status deployment.v1.apps/capstone'
      }
    }
    
    /*stage('Upload to AWS.') {
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
    }*/
    

  }
}
