Feature: Manage survey
  In order to make a survey website
  As a user 
  I want to create and manage surveys
  
  Scenario: Create Valid Survey 
  	Given I have no Surveys 
  	And I am on the Surveys page 
  	When I press "New Survey" 
  	And I fill in "Name" with "Animals" 
  	And I press "Create Survey" 
  	Then I should be redirected to Survey
  	Then I should have 1 Survey
