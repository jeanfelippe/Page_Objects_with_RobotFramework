*** Settings ***
Documentation

Library    Browser


*** Keywords ***
User is logged in

    [Arguments]    ${email}
    ${element}    Set Variable    css=.logged-user
    #vai buscar no css logged-user para realizar o asset e comparar com o email informado no login.robot

    Wait For Elements State    ${element}    visible    5
    Get Text                   ${element}    equal      ${email}

