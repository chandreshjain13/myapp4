pipeline {
   agent any
    tools {
      pipeline {
  agent any
  tools {
    jdk 'java'
    maven 'maven'
      }
      stages{
        stage('Clone') {
          steps {
           git 'https://github.com/chandreshjain13/myapp4.git''
         }
        }
        stage('Build') {
          steps {
            sh 'mvn clean package'
          }
        }
        stage('Sonar-Publish') {
          steps {
            sh 'mvn sonar:sonar -Dsonar.host.url=http://3.84.156.70:9000/ -Dsonar.login=1f331b9d2ce09b7d610c6c7103c67faf9f034258'
          }
        }
        stage('Docker-Build') {
          steps {
            sh 'docker build -t avis1418/mywebbapp:1.0.1 .'
        }
      }
        stage('Docker-Push') {
          steps {
            sh 'docker push avis1418/mywebbapp:1.0.1'
        }
      }
        stage('Docker-Run') {
          steps {
            sh 'ssh -o "StrictHostKeyChecking=no" -i /home/centos/key.pem centos@34.201.39.114 sudo docker run -it -p 8080:8080 -d --name myapp avis1418/mywebbapp:1.0.1'
        }
      }
      }  
}
