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

  Scenario: I can add a markdown section to an existing blog
    Given a blog named "BDD Overview"
    When I edit the blog named "BDD Overview" blog
    And add a Markdown Section to the blog
    And add a title "Cucumber" and text "Pickle" to the Markdown Section
    Then the Markdown Section with title "Cucumber" and text "Pickle" is stored in the blog

    Scenario: I can add an image section to an existing blog
    Given a blog named "BDD Overview"
    When I edit the blog named "BDD Overview" blog
    And add a Big Image Section to the blog
    And add a title named "Cucumber" and Image "Pickle" to the Big Image Section
    Then the Big Image Section with title "Cucumber" and image "Cucumber" is stored in the blog

  Scenario: I can add a code section to an existing blog
    Given a blog named "BDD Overview"
    When I edit the blog named "BDD Overview" blog
    And add a Code Section to the blog
    And add a title named "Blog Controller" and code "class BlogController" to the Section 
    Then the Code Section with title "Blog Controller" and code "class BlogController < ApplicationController end" is stored in the blog

  Scenario: I can delete a blog
    Given a blog named "BDD Overview"
    When I edit the blog named "BDD Overview" blog
    Then I can delete the blog
