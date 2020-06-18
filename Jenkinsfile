
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
        /*sh 'kubectl run my-app --image=nouranelkassas/capstone --port=3000'
        sh 'kubectl get deployments'
        sh 'kubectl expose deployment capstone --type=LoadBalancer --port=80 --target-port=3000'
        sh 'kubectl get svc'
        sh 'kubectl set image deployment/capstone  my-app=nouranelkassas/capstone'
        sh 'kubectl create -f jenkins-deployment.yaml --namespace jenkins'
        sh 'kubectl create -f jenkins-service.yaml --namespace jenkins'
        sh 'sudo ./run_kubernetes.sh'
        def image_id = registry + ":latest"*/
        sh "ansible-playbook  playbook.yml --extra-vars nouranelkassas/capstone"
               
        
      }
        }
    /*stage('Deploy Stack'){
      steps{
        sh 'docker stack deploy --namespace capstone --compose-file docker-compose.yml mystack'
      }
    }*/
    
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
