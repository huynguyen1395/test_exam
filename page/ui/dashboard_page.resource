*** Settings ***
Library     AppiumLibrary
Library    String
Resource    ../../locator/dashboard_page_locator.resource

*** Keywords ***
Check Create Project Success
    [Arguments]     ${project_name}
    Open List Project
    ${project_name_locator}     Replace String    ${txtview_project_name}      {{project_name}}     ${project_name}
    Wait Until Element Is Visible    ${project_name_locator}    timeout=5

Open List Project
    Wait Until Page Contains Element    ${txtview_list_project}
    Click Element    ${txtview_list_project}

Open Project Page
    [Arguments]     ${project_name}
    ${project_name_locator}     Replace String    ${txtview_project_name}      {{project_name}}     ${project_name}
    Wait Until Page Contains Element    ${project_name_locator}
    Click Element    ${project_name_locator}


