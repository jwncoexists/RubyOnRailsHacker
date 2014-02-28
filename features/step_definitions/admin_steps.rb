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

  within_fieldset 'login-form-fieldset' do
    click_button('Login')
  end
  page.should have_selector ".alert", text: "You are now logged in to Ruby on Rails Hacker."
  # save_and_open_page
end

Then(/^I can see links to administrative functions$/) do
    expect(page).to have_content "New"
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


Then(/^I can delete the blog$/) do
  pending # express the regexp above with the code you wish you had
end
