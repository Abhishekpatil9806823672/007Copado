*** Settings ***
Documentation           Test suite for Pace starter.
Library                 QWeb
Suite Setup             Open Browser         ${Loginurl}         ${Browser}
Suite Teardown          Close All Browsers
*** Variables ***
${password}             Welcome@123 
${Loginurl}             https://robotic.copado.com/
${Browser}               chrome
${email}                patilpabhishek@gmail.com
*** Keywords ***
Open Browser To Login page
   # GoTo                ${Loginurl}                ${Browser}
    MaximizeWindow
Input Username
    [Arguments]          ${email}
    TypeText             //input[@id\='email']       ${email}
Input password
       [Arguments]          ${password}
      TypeSecret           //input[@id\='password']             ${password}      
    
*** Test Cases ***
Assignment4
    Open Browser To Login page
    Input Username         ${email}
    Input password          ${password}
    ClickText               LOGIN 
    Sleep                   2s
    ClickText                Run example tests 
 
    DropDown                 record                        All
    Sleep                    1s
    DropDown                 stream                        Yes
    Sleep                    2s
    DropDown                 runType                       development
    Sleep                    2s
    ClickText                xpath\=//button[@id\='suite-run-btn']
    Sleep                    1s
    SwitchWindow             NEW
    VerifyText               Please wait while the video stream is being created. This page will auto-update once it is ready.
    XhrTimeout                10s    


    