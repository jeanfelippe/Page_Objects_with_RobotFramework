*** Settings ***
Documentation

Library    Browser
Library    libs/Account.py

Resource    pages/Landing.resource
Resource    pages/Welcome.resource
Resource    pages/Login.resource
Resource    pages/Account.resource

*** Keywords ***
#consigo definir keywords para realizar chamadas de rotinas e melhorar as boas práticas no código evitando repetição
Start session
        New Browser    browser=chromium    headless=False 
    #comando New Browser com Headless false exibe o teste com navegador aberto
        New Page     http://localhost:3000