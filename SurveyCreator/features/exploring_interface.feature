Feature: Exploring interface
  In order to make a survey website
  As a user 
  I want to explore through the interface correctly 
  
Scenario: Check Home page
	Given I am on the Home page 
	Then I should see "Welcome to the Survey Creator"   

Scenario: Check public surveys  
	Given I am on the Home page
	When I press Survey
	Then I should see the public surveys 