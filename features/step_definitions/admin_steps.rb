Given(/^an administrative user named "(.*?)"$/) do |name|
    @user = User.create!(
    name: name,
    email: "admin@example.com",
    password: "letmeinplease",
    password_confirmation: "letmeinplease",
    confirmed_at: Time.now,
    account: 'admin'
  )
end

Given(/^I log in as the administrator named "(.*?)"$/) do |name|
  
  visit(login_path)
  fill_in 'login-email-page', with: 'admin@example.com'
  fill_in 'login-password-page', with: 'letmeinplease'

  within_fieldset 'login-page' do
    click_button('Login')
  end
  page.should have_selector ".alert", text: "You are now logged in to Ruby on Rails Hacker."
  # save_and_open_page
end

Then(/^I can see links to administrative functions$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^an existing blog named "(.*?)" with a Markdown Section named "(.*?)"$/) do |arg1, arg2|
  pending # express the regexp above with the code you wish you had
end

Given(/^I visit the Manage Blogs home page$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I can see the blog named "(.*?)" and the blog named "(.*?)" on the Manage Blogs home page$/) do |arg1, arg2|
  pending # express the regexp above with the code you wish you had
end

Then(/^I can create a new blog named "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Given(/^a blog named "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

When(/^I edit the blog named "(.*?)" blog$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

When(/^change the blog name to "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then(/^the name of the blog is stored$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^add a Markdown Section to the blog$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^add a title "(.*?)" and text "(.*?)" to the Markdown Section$/) do |arg1, arg2|
  pending # express the regexp above with the code you wish you had
end

Then(/^the Markdown Section with title "(.*?)" and text "(.*?)" is stored in the blog$/) do |arg1, arg2|
  pending # express the regexp above with the code you wish you had
end

When(/^add a Big Image Section to the blog$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^add a title named "(.*?)" and Image "(.*?)" to the Big Image Section$/) do |arg1, arg2|
  pending # express the regexp above with the code you wish you had
end

Then(/^the Big Image Section with title "(.*?)" and image "(.*?)" is stored in the blog$/) do |arg1, arg2|
  pending # express the regexp above with the code you wish you had
end

When(/^add a Code Section to the blog$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^add a title named "(.*?)" and code "(.*?)" to the Section$/) do |arg1, arg2|
  pending # express the regexp above with the code you wish you had
end

Then(/^the Code Section with title "(.*?)" and code "(.*?)" is stored in the blog$/) do |arg1, arg2|
  pending # express the regexp above with the code you wish you had
end

Then(/^I can delete the blog$/) do
  pending # express the regexp above with the code you wish you had
end
