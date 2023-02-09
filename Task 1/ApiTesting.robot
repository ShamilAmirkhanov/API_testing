*** Settings ***
Library  SeleniumLibrary
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections

*** Variables ***

*** Test Cases ***
Scenario 1
    [documentation]  First test case
    [tags]  First
    Create Session  mysession  https://reqres.in  verify=true
    ${response}=  GET On Session  mysession  /api/users  params=page=1
    Status Should Be  200  ${response}  #Check Status as 200

    #Check this API request return 6 users in total
    ${per_page}=  Get Value From Json  ${response.json()}  per_page
    ${per_pageFromList}=  Get From List   ${per_page}  0
    Should be equal   ${per_pageFromList}  ${6}

    #Check the page number returned matches to the one specified in the URL
    ${page}=  Get Value From Json  ${response.json()}  page
    ${pageFromList}=  Get From List   ${page}  0
    Should be equal   ${pageFromList}  ${1}

    #Assert that the API request returns the user with the nessesary information

    FOR    ${user}    IN    @{response.json()['data']}
    ${email}=  Convert To String  ${user['email']}
    ${first_name}=  Convert To String  ${user['first_name']}
    ${last_name}=  Convert To String  ${user['last_name']}
    ${avatar}=  Convert To String  ${user['avatar']}
        IF    $email == "janet.weaver@reqres.in" and $first_name == "Janet" and $last_name == "Weaver" and $avatar == "https://reqres.in/img/faces/2-image.jpg"  LOG TO CONSOLE  "User with the necessary information exists"  BREAK
    END

Scenario 2
    [documentation]  Second test case
    [tags]  Second
    Create Session  mysession  https://reqres.in  verify=true
    ${response}=  GET On Session  mysession  /api/users  params=page=2
    Status Should Be  200  ${response}  #Check Status as 200

    #Check this API request return 6 users in total
    ${per_page}=  Get Value From Json  ${response.json()}  per_page
    ${per_pageFromList}=  Get From List   ${per_page}  0
    Should be equal   ${per_pageFromList}  ${6}

    #Check the page number returned matches to the one specified in the URL
    ${page}=  Get Value From Json  ${response.json()}  page
    ${pageFromList}=  Get From List   ${page}  0
    Should be equal   ${pageFromList}  ${2}

    #Assert that the API request returns the user with the nessesary information

    FOR    ${user}    IN    @{response.json()['data']}
    ${email}=  Convert To String  ${user['email']}
    ${first_name}=  Convert To String  ${user['first_name']}
    ${last_name}=  Convert To String  ${user['last_name']}
    ${avatar}=  Convert To String  ${user['avatar']}
        IF    $email == "byron.fields@reqres.in" and $first_name == "Byron" and $last_name == "Fields" and $avatar == "https://reqres.in/img/faces/10-image.jpg"  LOG TO CONSOLE  "User with the necessary information exists"  BREAK
    END

Scenario 3
    [documentation]  Second test case
    [tags]  Second
    Create Session  mysession  https://reqres.in  verify=true
    ${response}=  GET On Session  mysession  /api/users  params=page=12
    Log to console  ${response.content}  #Assert that no users are returned
*** Keywords ***