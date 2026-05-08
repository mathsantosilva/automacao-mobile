pipeline {
    agent any

    parameters {
        string(
            name: 'TAGS',
            defaultValue: '@br_login_multiuser_sucess',
            description: 'Tag(s) do Cucumber que serão executadas'
        )
    }

    stages {
        stage('Informar device') {
            steps {
                script {
                    env.DEVICE = input(
                        message: 'Informe o device/UDID que será usado na execução',
                        parameters: [
                            string(
                                name: 'DEVICE',
                                defaultValue: '0074732151',
                                description: 'UDID do dispositivo Android'
                            )
                        ]
                    )

                    echo "Device informado: ${env.DEVICE}"
                }
            }
        }

        stage('Entrar no repositório') {
            steps {
                dir('C:\\repositorios\\Mobile_Kairos\\automacao-mobile') {
                    bat 'echo Diretório atual: %CD%'
                }
            }
        }

        stage('Instalar dependências Ruby') {
            steps {
                dir('C:\\repositorios\\Mobile_Kairos\\automacao-mobile') {
                    bat 'bundle install'
                }
            }
        }

        stage('Verificar ambiente') {
            steps {
                dir('C:\\repositorios\\Mobile_Kairos\\automacao-mobile') {
                    bat 'ruby -v'
                    bat 'bundle -v'
                    bat 'adb devices'
                }
            }
        }

        stage('Executar testes') {
            steps {
                dir('C:\\repositorios\\Mobile_Kairos\\automacao-mobile') {
                    bat """
                    echo Executando com TAGS=%TAGS%
                    echo Device que será enviado para o console: %DEVICE%

                    echo %DEVICE% | bundle exec cucumber -t "%TAGS%"
                    """
            }
        }
}
    }

    post {
        always {
            dir('C:\\repositorios\\Mobile_Kairos\\automacao-mobile') {
                archiveArtifacts artifacts: 'logs/**/*, report/**/*', allowEmptyArchive: true
            }

            echo 'Finalizando pipeline.'
        }
    }
}