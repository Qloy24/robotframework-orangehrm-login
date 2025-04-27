*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    https://opensource-demo.orangehrmlive.com/web/index.php/auth/login

${VALIDUSER}    Admin
${VALIDPASS}    admin123

${INVALIDUSER}    quyen
${INVALIDPASS}    sairoibro

*** Test Cases ***
valid login
    [Documentation]    kiểm tra đăng nhập thành công
    Open Login Page
    Wait Until Element Is Visible    xpath=//*[@id="app"]/div[1]/div/div[1]/div/div[2]/div[2]/form/div[1]/div/div[2]/input    timeout=10s
    Input Username    ${VALIDUSER}
    Input Password    ${VALIDPASS}
    Sleep    5s
    Submit Credentials

invalid login
    [Documentation]    kiểm tra đăng nhập thất bại
    Open Login Page
    Wait Until Element Is Visible    xpath=//*[@id="app"]/div[1]/div/div[1]/div/div[2]/div[2]/form/div[1]/div/div[2]/input    timeout=10s
    Input Username    ${INVALIDUSER}
    Input Password    ${INVALIDPASS}
    Sleep    5s
    Submit Credentials

*** Keywords ***
Open Login Page
    [Documentation]   Open the login page
    Open Browser    ${URL}    chrome
    Go To    ${URL}

Input Username
    [Documentation]   Input the username
    [Arguments]    ${username}
    Input Text    xpath=//*[@id="app"]/div[1]/div/div[1]/div/div[2]/div[2]/form/div[1]/div/div[2]/input    ${username}

Input Password
    [Documentation]   Input the password
    [Arguments]    ${password}
    Input Text    xpath=//*[@id="app"]/div[1]/div/div[1]/div/div[2]/div[2]/form/div[2]/div/div[2]/input    ${password}

Submit Credentials
    TRY
        Click Element    //*[@id="app"]/div[1]/div/div[1]/div/div[2]/div[2]/form/div[3]/button
    EXCEPT
        Log To Console    Không tìm thấy nút đăng nhập
    END