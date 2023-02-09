*** Settings ***
Documentation     A test suite with a single test for invalid login.
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          resource.robot
*** Variables ***

*** Test Cases ***
Invalid Login
    Open Browser To Login Page
    Input Username    ${INVALID USER}
    Submit Credentials
    Element Text Should Be  ${INVALID LOGIN MESSAGE}  There is no account for the username or email you entered.
    Close Browser
Invalid Password
    Open Browser To Login Page
    Input Username    ${VALID USER}
    Submit Credentials
    Input Password    ${INVALID PASSWORD}
    Submit Credentials
    Element Should Contain  ${INVALID PASSWORD MESSAGE}   Incorrect password. You modified your password in the past 24 hours.
    Close Browser