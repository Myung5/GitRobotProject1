*** Settings ***
Library    SeleniumLibrary    

Suite Setup    Log    I am inside Test Suite Setup
Suite Teardown    Log    I am inside Test Suite Teardown
Test Setup    Log    I am inside Test Setup
Test Teardown    Log    I am inside Test Teardown 

Default Tags    sanity

   
*** Test Cases ***

MyFirstTest
    [Tags]    smoke
    Log    Hello World1...    
    
MySecondTest
    Set Tags    regression1
    Log    Hello World2...
    Remove Tags    regression1
    
MyThirdTest
    Log    Hello World3...
    
FirstSeleniumTest
    Open Browser    https://google.com    chrome  
    Set Browser Implicit Wait    5
    Input Text    name=q    Automation step by step    
    #Press Keys    name=q    ENTER
    Click Button    name=btnK
    Sleep    4
    Close Browser
    Log    Test Completed
    
SampleLoginTest
    [Documentation]    This is a simple login test
    Open Browser    ${URL}    chrome
    Set Browser Implicit Wait    5
    LoginKW 
    #Input Text    id=txtUsername    @{CREDENTIALS}[0]    
    #Input Password    id=txtPassword    &{LOGINDATA}[password]    
    #Click Button    id=btnLogin 
    Click Element    id=welcome      
    Click Link    link=Logout
    Close Browser
    Log    Test completed  
    Log    This test was executed by %{USERNAME} on %{os}
    

*** Variables ***
${URL}    https://opensource-demo.orangehrmlive.com/
@{CREDENTIALS}    Admin    admin123
&{LOGINDATA}    username=Admin    password=admin123


*** Keywords ***
 LoginKW
    Input Text        id=txtUsername    @{CREDENTIALS}[0]    
    Input Password    id=txtPassword    &{LOGINDATA}[password]    
    Click Button      id=btnLogin 
