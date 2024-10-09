*** Keywords ***
When user login to Fit Way platform with  ${email}, ${password}
    Click Signup Button
    Input Email    ${email}
    Input Password    ${password}
    Submit Login Form

Click Login Button
    Wait Until Element Is Visible    xpath=//button[contains(text(), 'เข้าสู่ระบบ')]    10s
    Click Button    xpath=//button[contains(text(), 'เข้าสู่ระบบ')]

Input Email
    [Arguments]    ${email}
    Input Text    xpath=//input[@name='email']    ${email}

Input Password
    [Arguments]    ${password}
    [Documentation]    รหัสผ่าน 8 ตัวขึ้นไป โดยประกอบด้วยอักษร a-z, A-Z และ 0-9
    Should Match Regexp    ${password}    (?=.*[a-z])(?=.*[A-Z])(?=.*\d)[A-Za-z\d]{8,}
    Input Text    xpath=//input[@placeholder='รหัสผ่าน']    ${password}

Submit Login Form
    [Documentation]    กดปุ่มเพื่อส่งแบบฟอร์มเข้าสู่ระบบ
    Wait Until Element Is Visible    xpath=//button[text()='เข้าสู่ระบบ']    5s
    Click Button    xpath=//button[text()='เข้าสู่ระบบ']

Verify Login Success
    [Documentation]    ตรวจสอบหน้าที่แสดงข้อความ ยินดีต้อนรับเข้าสู่ระบบ
    Wait Until Page Contains     ยินดีต้อนรับเข้าสู่ระบบ    10s
    Page Should Contain          ยินดีต้อนรับเข้าสู่ระบบ