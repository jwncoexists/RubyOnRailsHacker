Feature: admin login to home page

  As an administrative user I can login to the admin home page

  Background:
    Given an administrative user named "Test Admin User"
    And I log in as the administrator named "Test Admin User"

  Scenario: An admin can login to the Admin home page
    Then I can see links to administrative functions