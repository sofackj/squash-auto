*** Settings ***
Documentation     Simple example using SeleniumLibrary.
Library           SeleniumLibrary

*** Variables ***
${LOGIN URL}    http://www.amazon.fr
${BROWSER}    Chrome
${LOGIN}    sofa.kreutz@yahoo.fr
${MDP}    Ininja69
${USERNAME}    SOFACK-LEMAIRE

*** Test Cases ***
Valid Login
    Open Browser To Login Page
    Accept Cookie
    Click to Login Page
    Send Login
    Click to Continue
    Send Password
    Click to Sign in
    Check Username
    [Teardown]    Close Browser

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${LOGIN URL}    ${BROWSER}

Accept Cookie
    Wait Until Element Is Visible    sp-cc-accept
    Click Element    sp-cc-accept

Click to Login Page
    Wait Until Element Is Visible    nav-signin-tooltip
    Click Element    nav-signin-tooltip

Send Login
    Input Text    ap_email    ${LOGIN}

Click to Continue
    Click Element    continue

Send Password
    Input Password    password    ${MDP}

Click to Sign in
    Click Element    signInSubmit

Check Username
    Wait Until Element Is Visible    nav-link-accountList-nav-line-1
    Element Should Contain    nav-link-accountList-nav-line-1    ${USERNAME}
    