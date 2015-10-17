Feature: Create Account
  In order to make a survey website
  As a user I want to create an account and be able to log in and log out 
  	
Scenario:  Create Account
	Given I am on the sign up page 
	And I fill in Email with email@gmail.com 
	And I fill in Password with abcdefghijk 
	And I fill in Password_confirmation with abcdefghijk 
   	And I press “Sign up” 
	Then I should see "Welcome to the Survey Creator"   

Scenario:  Log out
	Given I am a new, authenticated user  
   	And I press link "Log out" 
	Then I should see "Welcome to the Survey Creator"   

Scenario:  Log in 
   	Given I am a new, authenticated user
	Then I should see "Welcome to the Survey Creator"   
