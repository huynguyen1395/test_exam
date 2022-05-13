*** Settings ***
Resource    ../common.resource
Resource    ../../locator/login_page_locator.resource

*** Keywords ***
# This keyword use to login, loginType is accepted Email, Google, Facebook
Login To Application
    [Arguments]     ${login_type}
    Open Mobile Application
    IF    '${login_type}' == 'Email'
        Run Keyword    Select Email To Login
    END
    Wait Until Page Contains Element    ${email_edit_text}
    Input Text    ${email_edit_text}   ${email}
    Click Element    ${btn_continue_with_mail}
    Wait Until Page Contains Element    ${password_edit_text}
    Input Text    ${password_edit_text}     ${password}
    Click Element    ${btn_login}
    # Wait about 5s to load page and data
    Sleep    5s

Select Email To Login
    # Wait and Click button login with email
    Wait Until Page Contains Element    ${btnLoginEmail}
    Click Element    ${btnLoginEmail}

Select Google To Login
    # To be define

Select Facebook To Login
    # To be define

