Feature: Manage survey
  In order to make a survey website
  As a user 
  I want to create and manage surveys
  
  Scenario: Create Valid Survey 
    Given I have no Surveys
    And I am a new, authenticated user
    And I am on the Surveys page 
    When I press "New Survey" 
    And I fill in "Name" with "Animals" 
    And I check "Publish(only check this if you are sure this is your final version of the survey)"
    And I press "Create Survey"
    And I am on the Published page 
    Then I should see "Survey was successfully created."
    Then I should see "Animals"

