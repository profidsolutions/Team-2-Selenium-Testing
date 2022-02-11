Scenario: Home Page should have a signup link
  Given  A New User 
  When   They come into our web page
  Then   They should immediately see a "sign up" link
  
NOTE: The link should have a name of "sign-up"

Scenario: There should should be login end point
  Given A GET to /login/{username}/{password} 
  When it is invoked with the username of admin
  And a password of pilot
  Then it should return a status 200
  
Scenario: There should should be login end point
  Given A GET to /login/{username}/{password} 
  When it is invoked with the username of admin
  And a password of badclock
  Then it should return a status 401
  
 ----------------------STOP---------------------
  
Scenario: Create Profile
Given any user
When user clicks on Create Profile
Then user add his informations (name, last name, email, weight, height, age, user name, password, notification (check box))
Then user receive a pop-up notification confirming the creation of the profile

Scenario: User Login
Given     User is on login page
When      User enters username and password
And       User hits enter 
Then      User is logged in and goes to their profile 

Scenario: Invalid username
Given     User is on login page
When      User enters an invalid username and valid password
And       User hits enter 
Then      Message Displayed as Invalid Login and stays on same page

Scenario: Invalid password
Given     User is on login page
When      User enters a valid username and invalid password
And       User hits enter 
Then      Message Displayed as Invalid Login

Scenario: Invalid user name and password
Given     User is on login page
When      User enters a valid username and invalid password
And       User hits enter 
Then      Message Displayed as Invalid Login

Scenario: A Recover Password Link Should always be displayed in the login page
Given:    The user forgot their password and they know it
When:     When they go to the login page    
Then      There should be link with the recover password

Scenario: After 3 login attempts
Given     User is on login page
When      User enters either an valid username and invalid password
And       User hits enter
And       Is on the 3rd attempt
Then      Message Displayed as Invalid Login
And       They cannot login for 24 hours
And       Remind the user that there is a link to recover password

Scenario: Blank username
Given     User is on login page
When      User does not enter a username 
But       Enters a valid password
And       User hits enter 
Then      Message Displayed as Username required

Scenario: Blank password
Given     User is on login page
When      User enters a valid username
But       User enter an invalid password
And       User hits enter 
Then      Message Displayed as Password required

Scenario: Blank username and blank password
Given     User is on login page
When      User doesn't enter a username
And       User doesn't enter a password
And       User hits enter 
Then      Message Displayed as both username and password are required



Scenario: Home Page
Given     User is logged in 
When      User is on HomePage
Then      User is able to see the daily exercises to be done

Scenario: User successfully logs in and is immediately taken to their User Profile
Given     User is logged in 
When      User clicks on Profile 
Then      User is able to see his details

Scenario: Daily Workout Routine
Given     User is on Daily Workout Routine Page
When      User selects the date
Then      List of excercise displays 
And       User is able to add the daily data corresponding to each excercise

Scenario: Track number of bench pressed done
Given     I did 15 bench press sets of 10 reps, 70 kg
When      I try to update my logs for the day
Then      The number of benches completes of 70 kg increments by 150, the number
	  of calories burned increases by 90

Scenario: Track calories burned throughout day
Given     I weigh <kg>, I did <x> reps of bench presses at <x1> kgs, 
          <y> reps of squats etc.
When      I try to calculate the calories burned for the day
Then      The program returns eg. kg * ((0.00183 * x * x1/kg) + (0.0016 * y)) 
	  calories burned in that day.
	  
Scenario: Display daily workout data
Given     user finished inputting data 
When      user clicks button updating today's workout 
Then      records are updated, user is able to see the updated records page 

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

	Scenario: User registration or log in prompt
		Given the user is not logged in
		When the user opens the home page
		Then the user is prompted to register or log in


    
    
Scenario: Create Profile
Given any user
When user clicks on Create Profile
Then user add his informations (name, last name, email, weight, height, age, user name, password, notification (check box))
Then user receive a pop-up notification confirming the creation of the profile

Scenario: Update Profile
Given user Profile
When user clicks on update Profile
Then user is able to see his details
And modify details
Then user receive a pop-up notification confirming updating profile

Scenario: Delete Profile
Given user Profile
When user clicks on delete Profile
Then user receive a notification to confirm the delete
Then user click on Yes
And receive a pop-up notification confirming delete profile

Scenario: Adding a specific workout Given the user knows his workout and just wants to have a history of his training When user logged in And enters the information of the exercises performed along with the weight Then the app will save your progress and show it in the statistics




Scenario: Choose a workout 
Given user Profile
When user clicks on workouts Then filter workout by duration and intensity, or search by workout
Then choose a workout

Scenario: choosing the type of weight loser 
Given: user click on method 
When: user choose which method (diet, exercise, fasting) 
Then: the chosen method is displayed


Feature: Back-end API Tests

  Scenario: There should should be login end point
     Given: A POST to /register 
     And:   With a JSON that contains username and a password
  
	Scenario: Daily Workout Routine
		Given the user is on Daily Workout Routine Page
		When the user selects the date
		Then the list of excercise from that day displays
		And the user is able to add their exercise data for that day

	Scenario: Track number of bench pressed done
		Given the user did 15 bench press sets of 10 reps, 70 kg
		When the user tries to update their logs for the day
		Then The number of 70kg benche presses completed increments by 150
