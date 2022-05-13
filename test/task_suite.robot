*** Settings ***
Resource    ../page/ui/login_page.resource
Resource    ../locator/login_page_locator.resource
Resource    ../page/ui/home_page.resource
Resource    ../page//ui/dashboard_page.resource
Resource    ../page//ui/project_page.resource
Resource    ../page/api/project.resource
Resource    ../page/api/task.resource

#Test Setup  Login To Application   ${type_email}
Test Teardown   Run Keywords    Clean Project Data       ${create_project_res['id']}    AND    Close Mobile Application

*** Test Cases ***
TC001_Create_Task_Successfully
    # Create Project By API
    ${create_project_res}   Create New Project
    Login To Application    ${type_email}
    Navigate To DashBoard Page
    Open List Project
    Open Project Page        ${create_project_res['name']}
    Add New Task
    # Get Active Task By API and checking
    Get Active Task     ${create_project_res['id']}

TC002_Reopen_Task_Successfully
    # Create Project By API
    ${create_project_res}   Create New Project
    Login To Application    ${type_email}
    Navigate To DashBoard Page
    Open List Project
    Open Project Page        ${create_project_res['name']}
    Add New Task
    ${get_active_tasks_res}     Get Active Task    ${create_project_res['id']}
    Completed Task
    # Reopen task by API
    Reopen Task    ${get_active_tasks_res[0]['id']}
    Check Reopen Task Success    ${create_project_res['name']}  ${get_active_tasks_res[0]['content']}


    


