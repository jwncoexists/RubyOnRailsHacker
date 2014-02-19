RubyOnRailsHacker
====================
This is a collection how-to blogs on using Ruby on Rails by Jennifer Nelson


* System dependencies
---

Ruby version 2.0, Rails Version 4
Redis, PostgreSQL, Resque, Stripe, YouTube, Bootstrap, email account


* Deployment to your Local Machine
---
1.  Install Rails 4.0 and Ruby 2.0
2.  Install Cucumber using instructions from https://github.com/cucumber/cucumber-rails/blob/master/README.md


* Create an Administrative User
---
1.  Bring up the StrategicHR app, register as a new user
2.  In the terminal window, use Rails Console to manually create an administrative user with the account type of "admin"


* Configuration
---


1.  Configure Email

Emails are sent to new users when they register in order to confirm their
email address.  Do the following to setup email:

  a.  Copy the "config/application.example.yml" file, and remove "example" from the name.

  b.  Specify your production and development email configurations in this file. Your application.yml should contain your sensitive credentials. It should be included in .gitIgnore as well.

3.  Establish a Stripe Account For Payment:

4.  Configure Environment Variables</b>


* Creating New Blogs
---
Log in to StrategicHR as an administrative user, and do the following to create a new course:



* Running the test suite
---
bundle exec cucumber
rake test
rspec spec


* Services (job queues, cache servers, search engines, etc.)
---


```











