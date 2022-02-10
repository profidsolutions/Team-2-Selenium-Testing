Feature: Front-end Tests

	Scenario: the user Login
		Given the user is on the login page
		When the user enters their username and password
		And the user hits enter
		Then the user is logged in

	Scenario: Invalid username
		Given the user is on the login page
		When the user enters an invalid username and valid password
		And the user hits enter
		Then the message "Invalid Login" is displayed

	Scenario: Invalid password
		Given the user is on the login page
		When the user enters a valid username and invalid password
		And the user hits enter
		Then the message "Invalid Login" is displayed

	Scenario: Blank username
		Given the user is on the login page
		When the user enters an invalid username and valid password
		And the user hits enter
		Then the message "Username required" is displayed

	Scenario: Blank password
		Given the user is on the login page
		When the user enters a valid username and invalid password
		And the user hits enter
		Then the message "Password required" is displayed

	Scenario: Home Page
		Given the user is logged in
		When the user is on home page
		Then the user is able to see their daily exercise tasks

	Scenario: User Profile
		Given the user is logged in
		When the user clicks on Profile
		Then the user is able to see their details

	Scenario: Display daily workout data
		Given the user finished inputting data on a workout
		When the user clicks the button "Updating today's workout"
		Then records are updated, the user is able to see the updated records page

	Scenario: Switch units from kgs to lbs
		Given the user is logged in
		And the user in viewing reps section in kg
		When the user clicks switch units
		Then the user sees weights in lbs

	Scenario: Enter invalid weight for equipment
		Given the user is in the weight selecting area for equipment
		When the user enters invalid weight
		And the user hits enter
		Then The message "Invalid Weight" is displayed

	Scenario: User registration prompt
		Given the user installed the application
		When the user opens the app for the first time
		Then the user can register to get their profile

Feature: Back-end Tests

	Scenario: Daily Workout Routine
		Given the user is on Daily Workout Routine Page
		When the user selects the date
		Then the list of excercise from that day displays
		And the user is able to add their exercise data for that day

	Scenario: Track number of bench pressed done
		Given the user did 15 bench press sets of 10 reps, 70 kg
		When the user tries to update their logs for the day
		Then The number of benches completes of 70 kg increments by 150