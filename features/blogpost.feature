Feature: Blogpost feature
  Test the functionality of blogpost

  Scenario: Edit another User blogpost - negative
    Given I have logged in as a regular user
    And I retrieve another User blogposts
    Then I can edit another User blogpost