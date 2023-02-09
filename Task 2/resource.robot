*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
Library           SeleniumLibrary

*** Variables ***
${SERVER}         www.evernote.com
${BROWSER}        edge
${DELAY}          0
${INVALID USER}     shamil.a003@gmail.com
${INVALID PASSWORD}  1234
${VALID USER}  #Please use your credentials
${VALID PASSWORD}  #Please use your credentials
${LOGIN URL}      http://${SERVER}/Login.action
${INVALID LOGIN MESSAGE}        //*[@id="responseMessage"]
${INVALID PASSWORD MESSAGE}  //*[@id="password-wrapper"]/div

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Login Page Should Be Open

Login Page Should Be Open
    Title Should Be    Welcome Back

Go To Login Page
    Go To    ${LOGIN URL}
    Login Page Should Be Open

Input Username
    [Arguments]    ${username}
    Input Text    username    ${username}

Input Password
    [Arguments]    ${password}
    Input Text    password    ${password}

Submit Credentials
    Click Button    loginButton
    sleep  3

New Note
    sleep  10
    Click Button  //*[@id="qa-HOME_WIDGET_CONTROL_Notes_2|0_0|0_L9FOY3|13"]/button
    sleep  3
