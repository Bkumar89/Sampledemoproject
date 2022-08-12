pipeline 
{
    agent any
    stages 
   {
        stage('BUILD') 
        {
            steps 
            {
                sh 'echo "Inside Build Satge"'
            }
        }
        stage('TEST') 
        {
            steps 
            {
                sh 'echo "Inside Test Stage"'
            }
        }
        stage('DELIVER_DEVELOP') 
        {
            when 
            {
                branch 'DEVELOP' 
            }
            steps 
            {
                sh 'echo "Inside DELIVER_DEVELOP stage. Executed for develop Branch"'
            }
        }
        stage('DELIVER_MASTER') 
        {
            when 
            {
                branch 'master'  
            }
            steps 
            {
                sh 'echo "Inside DELIVER_MASTER stage. Execution is for master branch"'
            }
        }
    }
}
