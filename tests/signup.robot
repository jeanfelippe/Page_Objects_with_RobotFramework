*** Settings ***
Documentation

Library    Browser

Resource    ../resources/base.resource

Test Setup    Start session 
    #start session é a palavra chave definida no arquivo base para instanciar a abertura da url 

Test Teardown    Take Screenshot
    #keyword nativa para disparar screenshot       


*** Test Cases ***
Deve iniciar cadastro de clientes
    ${account}    Get Fake Account
    #Utiliza a lib faker para gerar massa / a classe que contem a lib faker é a resources/libs/account

    #Start session
    #start session é a palavra chave definida no arquivo base para instanciar a abertura da url 


    #Get Text    css=.headline h2    equal    Sua Jornada Fitness Começa aqui! 

    Get Text    css=#signup h2    equal    Faça seu cadastro e venha para a Smartbit!

    Fill Text    id=name    ${account}[name]
    Fill Text    id=email   ${account}[email]
    Fill Text    id=document    ${account}[document]
    #Utiliza a lib faker para gerar massa / $account name gera nome falso, assim como email que gera emails falsos e document para cpfs

    #Fill Text    id=name    Jean Papa
    #Fill Text    id=email    pap1axa@gmail.com
    #Fill Text    id=document    26225925074

    Click    css=button >> text=Cadastrar

    #Wait For Elements State    text=Falta pouco para fazer parte da família Smartbit!    visible    5

    Verify welcome message
    #frase verify welcome message referencia a page welcome.resource, cujo qual é um arquivo page objects que valida a mensagem exibida #na tela welcome

    
    #Take Screenshot
    #keyword nativa para disparar screenshot

    Sleep    5

Campo nome deve ser obrigatorio
    [Tags]    required

    ${account}    Get Fake Account



    #Get Text    css=.headline h2    equal    Sua Jornada Fitness Começa aqui! 

    Get Text    css=#signup h2    equal    Faça seu cadastro e venha para a Smartbit!

    Fill Text    id=email   ${account}[email]
    Fill Text    id=document    ${account}[document]

    #Fill Text    id=name    Jean Papa
    #Fill Text    id=email    pap1axa@gmail.com
    #Fill Text    id=document    26225925074

    Click    css=button >> text=Cadastrar

    Wait For Elements State    css=form .notice    visible    5
    Get Text    css=form .notice    equal    Por favor informe o seu nome completo



    Sleep    5    

Campo email deve ser obrigatorio
    [Tags]    required

    ${account}    Get Fake Account



    #Get Text    css=.headline h2    equal    Sua Jornada Fitness Começa aqui! 

    Get Text    css=#signup h2    equal    Faça seu cadastro e venha para a Smartbit!

    Fill Text    id=name    ${account}[name]
    Fill Text    id=document    ${account}[document]

    #Fill Text    id=name    Jean Papa
    #Fill Text    id=email    pap1axa@gmail.com
    #Fill Text    id=document    26225925074

    Click    css=button >> text=Cadastrar

    Wait For Elements State    css=form .notice    visible    5
    Get Text    css=form .notice    equal    Por favor, informe o seu melhor e-mail


    Sleep    5  

Campo cpf deve ser obrigatorio
    [Tags]    required

    ${account}    Get Fake Account



    #Get Text    css=.headline h2    equal    Sua Jornada Fitness Começa aqui! 

    Get Text    css=#signup h2    equal    Faça seu cadastro e venha para a Smartbit!

    Fill Text    id=name    ${account}[name]
    Fill Text    id=email    ${account}[email]

    #Fill Text    id=name    Jean Papa
    #Fill Text    id=email    pap1axa@gmail.com
    #Fill Text    id=document    26225925074

    Click    css=button >> text=Cadastrar

    Wait For Elements State    css=form .notice    visible    5
    Get Text    css=form .notice    equal    Por favor, informe o seu CPF


    Sleep    5      


Email informado é inválido
    [Tags]    required

    ${account}    Get Fake Account


    #Get Text    css=.headline h2    equal    Sua Jornada Fitness Começa aqui! 

    Get Text    css=#signup h2    equal    Faça seu cadastro e venha para a Smartbit!

    Fill Text    id=name    ${account}[name]
    Fill Text    id=email    pap1axa*@*gmail.com
    Fill Text    id=document    ${account}[document]

    #Fill Text    id=name    Jean Papa
    #Fill Text    id=email    pap1axa@gmail.com
    #Fill Text    id=document    26225925074

    Click    css=button >> text=Cadastrar

    Wait For Elements State    css=form .notice    visible    5
    Get Text    css=form .notice    equal    Oops! O email informado é inválido

    Sleep    5  


CPF informado é inválido
    [Tags]    required

    ${account}    Get Fake Account

    #New Browser    browser=chromium    headless=False 
    #comando New Browser com Headless false exibe o teste com navegador aberto
    #New Page     http://localhost:3000



    #Get Text    css=.headline h2    equal    Sua Jornada Fitness Começa aqui! 

    Get Text    css=#signup h2    equal    Faça seu cadastro e venha para a Smartbit!

    Fill Text    id=name    ${account}[name]
    Fill Text    id=email    ${account}[email]
    Fill Text    id=document    15250115455

    #Fill Text    id=name    Jean Papa
    #Fill Text    id=email    pap1axa@gmail.com
    #Fill Text    id=document    26225925074

    Click    css=button >> text=Cadastrar

    Wait For Elements State    css=form .notice    visible    5
    Get Text    css=form .notice    equal    Oops! O CPF informado é inválido

    Sleep    5 



*** Keywords ***