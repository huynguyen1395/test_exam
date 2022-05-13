*** Settings ***
Resource    ../page/ui/login_page.resource
Resource    ../locator/login_page_locator.resource
Resource    ../page/ui/home_page.resource
Resource    ../page/ui/dashboard_page.resource
Resource    ../page/api/project.resource

# Test Setup  Login To Application   ${type_email}
#Test Teardown   Run Keywords    Clean Project Data       ${create_project_res['id']}    AND    Close Mobile Application

*** Test Cases ***
TC001_Create_Project_Successfully
    # Create Project By API
    ${create_project_res}   Create New Project
    Login To Application    ${type_email}
    Navigate To DashBoard Page
    Check Create Project Success    ${create_project_res['name']}