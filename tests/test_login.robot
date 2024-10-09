*** Settings ***
Library         SeleniumLibrary
Resource        ../keywords/SignupPageKeywords.robot
Resource        ../keywords/HomePageKeywords.robot
Variables       ../resources/config/config.yaml
Variables       ../resources/testdata/testdata.yaml
Suite Setup     Open Browser    ${baseUrl}    chrome
Suite Teardown  Close Browser

*** Test Cases ***
As a user, I want to login successfully with valid data
    When user login to Fit Way platform with  ${signup_email}, ${signup_password}
    Then Fit Way should display OTP page with message as "ยินดีต้อนรับเข้าสู่ระบบ"

As a user, I fail to login with invalid email
    When user login to Fit Way platform with  ${invalid_email}, ${signup_password}
    Then Fit Way should display error message as "กรุณากรอกอีเมลให้ถูกต้อง"