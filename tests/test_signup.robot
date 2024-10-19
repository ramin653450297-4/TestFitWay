*** Settings ***
Library         SeleniumLibrary
Resource        ../keywords/SignupPageKeywords.robot
Resource        ../keywords/HomePageKeywords.robot
Variables       ../resources/config/config.yaml
Variables       ../resources/testdata/testdata.yaml
Suite Setup     Open Browser    ${baseUrl}    chrome
Suite Teardown  Close Browser

*** Test Cases ***
As a user, I want to signup successfully with valid data
    When user signup to Fit Way platform with ${signup_name}, ${signup_lastname}, ${signup_email}, ${signup_phone}, and ${signup_password}
    Then Fit Way should display message as "สมัครสมาชิกเสร็จสิ้น"

As a user, I fail to signup with invalid email
    When user signup to Fit Way platform with ${signup_name}, ${signup_lastname}, ${invalid_email}, ${signup_phone}, and ${signup_password}