*** Settings ***
Resource    ../common.resource
Resource    ../../locator/project_page_locator.resource
Library     ../../request_helper/request_helper.py

*** Keywords ***
Get Active Task
    [Arguments]     ${project_id}
    ${get_task_url}   Set Variable    ${api_host}${get_tasks_endpoint}
    ${json}     Get Data Json       task.json
    ${params}   Set Variable        ${json['get_active_task']['params']}
    Set To Dictionary    ${params}    project_id=${project_id}
    ${headers}  Set Variable    ${json['get_active_task']['headers']}
    Set To Dictionary    ${headers}     Authorization=${api_key}
    Log    ${get_task_url}
    Log    ${params}
    Log    ${headers}
    ${get_active_task_res}    Get Request     ${get_task_url}      ${params}        ${headers}
    Should Be Equal As Integers    ${get_active_task_res.status_code}    200
    Should Be Equal    ${get_active_task_res.json()[0]['content']}  ${message_task}
    ${count_tasks}  Get Length      ${get_active_task_res.json()}
    Should Be Equal As Integers    ${count_tasks}   1
    [Return]    ${get_active_task_res.json()}

Reopen Task
    [Arguments]     ${task_id}
    Sleep    5s
    ${reopen_task_url}   Set Variable    ${api_host}${reopen_task_enpoint}
    ${task_id}      Convert To String    ${task_id}
    ${reopen_task_url}      Replace String    ${reopen_task_url}    {{task_id}}    ${task_id}
    ${json}     Get Data Json       task.json
    ${headers}  Set Variable    ${json['reopen_task']['headers']}
    Set To Dictionary    ${headers}     Authorization=${api_key}
    Log    ${reopen_task_url}
    Log    ${headers}
    ${reopen_task_res}    Post Request     ${reopen_task_url}      ${None}     ${headers}
    Should Be Equal As Integers    ${reopen_task_res.status_code}    204
    # Sleep 5s to update data
    Sleep   5s


