Feature: Login feature
  Test the functionality of login

  Scenario: Edit profile information - positive
    Given I have logged in as a regular user
    And I can access my profile information
    Then I can edit my profile information
    And I can access my profile information
    Then I can set profile information to default