Feature: Exploring interface
  In order to make a survey website
  As a user 
  I want to explore through the interface correctly 
  
Scenario: Check Home page
	Given I am on the Home page 
	Then I should see "Welcome to the Survey Creator"   

Scenario: Check public surveys  
	Given I am on the Home page 
	When I press link "Answer Surveys"
	Then I should see "Listing Public Surveys" 
	Then I should see a table 

Scenario: Answer question 
    Given I have no Surveys
    And I am a new, authenticated user
    And I am on the Surveys page 
    When I press link "New Survey" 
    And I fill in "Name" with "Animals"   
    And I fill in "survey_questions_attributes_0_question_content" with "Is it good?"
    And I check "Publish(only check this if you are sure this is your final version of the survey)"
    And I press "Create Survey"
    And I am on the Published page  
    And I press link "Answer Surveys" 
    And I press link "Answer Survey"  
    Then I should see "New Result"  
    And I press Create Result
	Then I should see "You done! The New Survey Survey" 
 