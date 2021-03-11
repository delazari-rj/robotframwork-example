*** Settings ***
Library		SeleniumLibrary
Test Setup	Open Browse		${appURL}	${browse}
Test Teardown	Close Browse

*** Variable ***
${appURL}	https://opensource-demo.orangehrmlive.com
${browse}	headlesschrome

*** Test Case ***
LoginTest With Valid Credentials
	[Tags]	Smoke	
	Maximaze Browse Window
	Enter Username
	Enter Password
	Click On Login Button
	Verify Dashboard for user

LogoutTest with Valid Credentials
	[Tags]	Smoke	
	Maximaze Browse Window
	Enter Username
	Enter Password
	Click On Login Button
	Verify Dashboard for user
	Logout from application

*** Keywords ***
Enter Username
	Input Text	id:txtUsername	admin

Enter Password
	Input Text	name:txtPassword	admin123

Click On Login Button
	Click Button	xpath://input[@value='LOGIN']

Verify Dashboard for user
	${url}	Get Location
	Log To Console	${url}
	Should Contain	${url} dashboard

Logout from application
	Click	Link	partial link:Welcome
	Sleep	3s
	Click 	Link 	link:Logout
