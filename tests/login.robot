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

Nao deve logar com senha incorreta
    
    Go to login page
    Submit login form       sac@smartbit.com    abc1
#Para validar esse Toast, precisei executar um comando para pegar o código fonte utilizado no momento do aparecimento do toast e assim, #descobrir o css Toastify__toast-body cujo qual é responsavel de exibir a mensagem de erro
    Wait For Elements State    css=.Toastify__toast-body    visible    5
    Get Text    css=.Toastify__toast-body    equal    As credenciais de acesso fornecidas são inválidas. Tente novamente!


Nao deve logar com email nao cadastrado
    
    Go to login page
    Submit login form       111c@smartbit.com    abc1
#Para validar esse Toast, precisei executar um comando para pegar o código fonte utilizado no momento do aparecimento do toast e assim, #descobrir o css Toastify__toast-body cujo qual é responsavel de exibir a mensagem de erro
    Wait For Elements State    css=.Toastify__toast-body    visible    5
    Get Text    css=.Toastify__toast-body    equal    As credenciais de acesso fornecidas são inválidas. Tente novamente!




Tentativa de login com dados incorretos
    #esse cenário está testando template que é semelhante ao data driven onde podemos testar diferentes massas
    [Template]    Login with verify notice
    ${EMPTY}    ${EMPTY}    Os campos email e senha são obrigatórios.
    # no caso ele irá verificar se campo email e senha estao vazios utilizando as variaveis da keyword e a frase vem da variavel #output_message    
    sac@smart.com    ${EMPTY}            Os campos email e senha são obrigatórios. 
    ${EMPTY}            pwd                Os campos email e senha são obrigatórios.




*** Keywords ***

Login with verify notice
    [Arguments]    ${email}    ${password}    ${output_message}
    #utilizado para test template que é semelhante ao data driven para testar massas diferentes em um mesmo cenario
    Go to login page
    Submit login form    ${email}    ${password}
    Wait For Elements State    css=form .notice    visible    5
    Get Text    css=form .notice    equal    ${output_message}



    Sleep    5
    