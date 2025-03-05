*** Settings ***
Documentation

Library    Browser

Resource    ../resources/base.resource

Test Setup    Start session 
    #start session é a palavra chave definida no arquivo base para instanciar a abertura da url 

Test Teardown    Take Screenshot
    #keyword nativa para disparar screenshot       


*** Test Cases ***
Deve Logar como gestor de agencia
    
    Go to login page

    Submit login form       sac@smartbit.com    pwd123

    User is logged in    sac@smartbit.com
  


*** Keywords ***