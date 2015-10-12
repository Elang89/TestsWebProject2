Feature: Manage survey
  In order to [goal]
  [stakeholder]
  wants [behaviour]
  
  Scenario: Register new survey
    Given I am on the new survey page
    When I fill in "name" with "name 1"
    And I press "Create"
    Then I should see "name 1"