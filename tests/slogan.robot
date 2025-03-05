*** Settings ***
Documentation

Library    Browser

*** Test Cases ***
Deve exibir o slogan na landing page
    New Browser    browser=chromium    headless=False 
    #comando New Browser com Headless false exibe o teste com navegador aberto
    New Page     http://localhost:3000
    Get Text    css=.headline h2    equal    Sua Jornada Fitness Começa aqui! 