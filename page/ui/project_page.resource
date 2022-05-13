*** Settings ***
Library    AppiumLibrary
Resource    ../../locator/project_page_locator.resource
Resource    login_page.resource
Resource    home_page.resource
Resource    dashboard_page.resource

*** Keywords ***
Add New Task
    Wait Until Page Contains Element    ${btn_add_task_locator}
    Click Element       ${btn_add_task_locator}
    Wait Until Page Contains Element    ${ipt_message_task_locator}
    Input Text      ${ipt_message_task_locator}       ${message_task}
    Click Element    ${txtview_date_locator}
    Click Element    ${txtview_tommorow}
    Click Element       ${btn_continue}
    # Back to project page
    Press Keycode    4
    # Sleep 5s to update data and load page
    Sleep   5s

Completed Task
    Wait Until Page Contains Element    ${chk_completed_task}
    Click Element    ${chk_completed_task}
    # Sleep 5s to update data and load page
    Sleep    5s

Check Reopen Task Success
    [Arguments]     ${project_name}     ${task_name}
    Close Application
    Login To Application    ${type_email}
    Navigate To DashBoard Page
    Open List Project
    Open Project Page        ${project_name}
    ${txtview_task_locator}     Replace String    ${txtview_task}   {{task}}    ${task_name}
    Wait Until Element Is Visible    ${txtview_task_locator}   timeout=5






