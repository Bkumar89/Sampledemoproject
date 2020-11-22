pipeline
{
   agent 
            {
               label 'agent1'
            }
    tools
       {
           maven 'Maven3.6.0'
          jdk 'Java1.8'
           
       }
 stages
     {
          stage ('GIT CHECKOUT')
                   {
                       steps
                            {
                                 step([$class: 'WsCleanup'])
                                 
                                 echo "Clonning the code"
                                 checkout([$class: 'GitSCM', branches: [[name: 'master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: '', url: 'https://github.com/Bkumar89/Sampledemoproject.git']]])
                             }
                     
                    }
          stage ('BUILD')
                   {
                       steps
                            {
                                 withEnv(["JAVA_HOME=${ tool 'Java1.8' }"])
                                  {
                                      script
                                       {
                                            def mavenhome=tool 'Maven3.6.0'
                                            def Java=tool 'Java1.8'
                                            sh "mvn -f ${WORKSPACE}/pom.xml clean install"
                                        }
                                        
                                   }
                             }
                     
                    }
          stage ('SONAR-SCAN')
                   {
                       steps
                            {
                              script
                              {
                                 def scannerHome = tool 'Sonar_Scanner_4.2'
	                              echo "${scannerHome}"
                                 def javaHome = tool 'Java1.8'
                                 withSonarQubeEnv('sonarserver')
                                 {
                                    sh "${scannerHome}/bin/sonar-scanner -Dsonar.host.url=http://100.25.28.139:9000 -Dsonar.projectKey=Sampledemoproject -Dsonar.projectName=Sampledemoproject -Dsonar.projectVersion=1.0 -Dsonar.sources=src"

                                 }
                              }
                            }
                     
                    }
      }
}
