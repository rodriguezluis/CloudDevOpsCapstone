def image = 'rodriguezluis/capstone-project'
def name = 'capstone-project'
pipeline {
    agent any
    stages {
    	stage("Lint Dockerfile") {
		steps{
      			sh 'hadolint --ignore DL3006 Dockerfile'
		}
    	}
    	stage('Building image') {
		steps {
	      		withCredentials([usernamePassword(credentialsId: 'docker', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]) {
		     		sh "docker build --tag ${name} ."
				sh "dockerpath=${image}"
				sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
		     		sh "docker tag ${name} ${image}"
	     			sh "docker push ${image}"
			}
      		}
    	}
	stage('Connect with EKS') {
      		steps {
        		withAWS(region:'us-west-2',credentials:'aws-credentials') {
            			sh "aws eks --region us-west-2 update-kubeconfig --name prod"
				sh "kubectl apply -f infrastructure/rolling-deployment.yml"
        		}
        	}
      	}
    	
    }
}