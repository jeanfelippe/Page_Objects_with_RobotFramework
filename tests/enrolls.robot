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
    Go to enroll form

    Fill Text    css=input[aria-label=select_account]    Fernando Papito
    Sleep    2
    
    #irá capturar o código html utilizado nesse instante e será exibido no comando log todo o texto html aqui para analise e captura de locator
    #através do log.report, consigo clicar no step de log html, copiar o código html de lá e colar aqui em algum arquivo como o temp.html, logo em seguida, form document com botao direito do mouse e consigo analisar o codigo html
    ${html}    Get Page Source
    Log    ${html}

    #Click    css= [css-1uccc91-singleValue="2 - Fernando Papito"]    
    Click    css=[data-testid="00000014141"]

    Sleep    5



*** Keywords ***

Go to Erolls
    Click    css=a[href="/memberships"]
    Sleep    5
    Wait For Elements State    css=h1 >> text=Matrículas    visible    5

Go to enroll form
    Click    css=a[href="/memberships/new"]
    Wait For Elements State    css=h1 >> text=Nova matrícula    visible    5
    