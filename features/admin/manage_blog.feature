Feature: admin manage blogs page

  In order to create and manage blogs on the rubyonrailshacker website,
  As an administrative user, I can view, add, update and delete blogs.

  Background:
    Given an administrative user named "Test Admin User"
    And I log in as the administrator named "Test Admin User"
    And I visit the Manage Blogs home page

  Scenario: I can see existing blogs
    Given an existing blog named "Installing Rails" with a Markdown Section named "Markdown"
    Given an existing blog named "Cucumber" with a Markdown Section named "Features"
    Then I can see the blog named "BDD Overview" and the blog named "Cucumber" on the Manage Blogs home page

  Scenario: I can add a new blog
    Then I can create a new blog named "BDD Overview"

  Scenario: I can change an existing blog
    Given a blog named "BDD Overview"
    When I edit the blog named "BDD Overview" blog
    And change the blog name to "Behaviour Driven Development"
    Then the name of the blog is stored

  Scenario: I can delete a blog
    Given a blog named "BDD Overview"
    When I edit the blog named "BDD Overview" blog
    Then I can delete the blog
