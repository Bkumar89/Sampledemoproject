pipeline
{
   agent 
            {
               label 'agent1'
            }
    tools
       {
           maven 'Maven3.6.0'
           
       }
   
   parameters
   {
      choice(name: 'BRANCH_NAME', choices: ['develop', 'master'], description: 'Please select the branch for the build. By default, Build will happen for develop.')
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
                                            //def Java=tool 'Java1.8'
                                            sh "mvn -f ${WORKSPACE}/pom.xml clean install"
                                            sh """
                                               mkdir -p ${WORKSPACE}/target/Sampledemoprojectartifacts
                                               mv ${WORKSPACE}/target/Sampledemoproject.war ${WORKSPACE}/target/Sampledemoprojectartifacts
                                               cd ${WORKSPACE}/target/
                                               zip -r Sampledemoprojectartifacts-${BUILD_NUMBER}.zip Sampledemoprojectartifacts
                                            """
                                            archiveArtifacts allowEmptyArchive: true, artifacts: 'target/*.zip', followSymlinks: false, onlyIfSuccessful: true                                          
                                        }
                                        
                                   }
                             }
                     
                    }
          stage ('SONAR-SCAN')
                   {
                       steps
                            {
                                 echo "Run The Sonar Scan"
                             }
                     
                    }
      }
}
