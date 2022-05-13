*** Settings ***
Library     AppiumLibrary
Library     OperatingSystem
Library     String
Library     Collections
Resource    ../config/env_config.resource
Resource    ../config/api_endpoint.resource

*** Keywords ***
Open Mobile Application
    Open Application    ${remoteUrl}    ${alias}     platformName=${platform_name}      appPackage=${app_package}      appActivity=${app_activity}   automationName=${uiautomator2}

Get Data Json
    [Arguments]     ${json_file_name}
    ${path}     Get File Path    ${path_data_json}${json_file_name}
    ${data}    Get File    ${path}
    ${json}     Evaluate    json.loads('''${data}''')   json
    [Return]    ${json}

Get File Path
    [Arguments]     ${file_path}
    ${path}     Join Path    ${CURDIR}      ${file_path}
    [Return]    ${path}

Random uuid String
    ${random_str}   Evaluate    uuid.uuid4()    modules=uuid
    ${random_str}   Convert To String    ${random_str}
    [Return]    ${random_str}

Close Mobile Application
    Close Application