*** Settings ***
Resource    ../common.resource
Library     ../../request_helper/request_helper.py

*** Keywords ***
Create New Project
    ${create_project_url}   Set Variable    ${api_host}${create_project_endpoint}
    ${json}     Get Data Json       project.json
    ${data}  Set Variable        ${json['create_project']['data']}
    ${random_str}     Generate Random String      length=8
    ${project_name}     Set Variable    Project ${random_str}
    Set To Dictionary    ${data}    name=${project_name}
    ${headers}  Set Variable    ${json['create_project']['headers']}
    ${request_id}     Random uuid String
    Set To Dictionary    ${headers}     X-Request-Id=${request_id}
    Set To Dictionary    ${headers}     Authorization=${api_key}
    Log    ${create_project_url}
    Log    ${data}
    Log    ${headers}
    ${create_project_res}    Post Request     ${create_project_url}      ${data}     ${headers}
    Should Be Equal As Integers    ${create_project_res.status_code}    200
    Should Be Equal    ${create_project_res.json()['name']}   ${project_name}
    [Return]    ${create_project_res.json()}

Clean Project Data
    [Arguments]     ${project_id}
    # Clean project
    ${url_delete_project}   Set Variable    ${api_host}${delete_project_endpoint}
    ${project_id}   Convert To String    ${project_id}
    ${url_delete_project}      Replace String    ${url_delete_project}     {{project_id}}     ${project_id}
    ${json}     Get Data Json       project.json
    ${headers}  Set Variable    ${json['delete_project']['headers']}
    ${request_id}     Random uuid String
    Set To Dictionary    ${headers}     X-Request-Id=${request_id}
    Set To Dictionary    ${headers}     Authorization=${api_key}
    Log    ${url_delete_project}
    Log    ${headers}
    ${delete_project_res}      Delete Request    ${url_delete_project}      ${headers}
    Should Be Equal As Strings    ${delete_project_res.status_code}    204