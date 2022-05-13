*** Settings ***
Library    AppiumLibrary
Resource    ../../locator/home_page_locator.resource

*** Keywords ***
Navigate To DashBoard Page
    Wait Until Page Contains Element   ${btn_dashboard}
    Click Element    ${btn_dashboard}
