*** Settings ***
Documentation

Library    Browser

Resource    ../resources/base.resource

Test Setup    Start session 
    #start session é a palavra chave definida no arquivo base para instanciar a abertura da url 

Test Teardown    Take Screenshot
    #keyword nativa para disparar screenshot       


*** Test Cases ***
Deve poder realizar uma nova adesao
    
    Go to login page

    Submit login form       sac@smartbit.com    pwd123

    User is logged in    sac@smartbit.com

    Go to Erolls



*** Keywords ***

Go to Erolls
    Click    css=a[href="/memberships"]
    Wait For Elements State    css=h1 >> text=Matrículas    visible    5
    