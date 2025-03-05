# Referência
Stack base baseada no curso universo Robot Framework de Fernando Papito

# Instalação
executar npm run dev dentro da pasta /robot-qax/smartbit/api

executar npm run dev dentro da pasta /robot-qax/smartbit/web

Acessar (http://localhost:3000/) para acessar a aplicação

Utilizar o serviço Neon Console (https://console.neon.tech/app/projects/little-meadow-90247657?branchId=br-crimson-glade-a8jl25l2&database=neondb) para gerar uma base de dados free e linkar ao projeto

Realizar o download do plugin Browser para visualizar os testes nas telas do browser -Seguir os passos da instalação da library browser -https://docs.robotframework.org/docs/different_libraries/browser


# Execução do teste
Para executar o teste é necessário executar o comando robot "nomedoarquivo.robot" / ex: robot slogan.robot

Para executar o teste enviando os arquivos que serão gerados de log para a pasta log, utilize o seguinte exemplo: robot -d ./logs tests/login.robot (fazendo assim com que o arquivo de teste "login.robot" execute e envie os registros para uma pasta chamada logs que deve ser gerada no diretório do projeto



#Credenciais de admin da tela login
sac@smartbit.com

pwd123

# Libs
Faker = Contem a biblioteca Faker que gera dados mockados/fakes como cpfs, emails e etc..
