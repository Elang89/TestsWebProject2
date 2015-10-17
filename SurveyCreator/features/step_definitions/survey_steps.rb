Given(/^I have no Surveys$/) do
	Survey.delete_all
end

Given(/^I am on the Surveys page$/) do
	visit "/surveys"
end

When(/^I fill in "(.*?)" with "(.*?)"$/) do |arg1, arg2|
	fill_in(arg1, :with => arg2)
end
 
When(/^I press "Create Survey"$/) do 
	click_button('Create Survey')
end

Then(/^I should see "(.*?)"$/) do |arg1| 
	expect(have_content(arg1)) 
end 

Given(/^I am on the Published page$/) do
	visit "/surveys/published"
end

Given (/^I am a new, authenticated user$/) do
  email = 'testing@man.net'
  password = '@L3jaNdR01'
  User.new(:email => email, :password => password, :password_confirmation => password).save!

  visit '/users/sign_in'
  fill_in "user_email", :with => email
  fill_in "user_password", :with => password
  click_button "Log in"
end 

When (/^(?:|I )check "([^"]*)"$/) do |field|
  check(field)
end

When(/^a answer_content is selected$/) do
  find("option[value='Very Good']").click 
end 

Given(/^I am on the Home page$/) do
  visit "/"
end

When(/^I press link "(.*?)"$/) do |arg1|
  click_link(arg1)
end

When(/^I press "Create Result"$/) do 
  click_button('Create Result')
end

Given(/^I am on the sign up page$/) do
  visit "/users/sign_up"
end


Given(/^I fill in Email with email@gmail\.com$/) do
  fill_in("Email", :with => "email@gmail.com")
end
 
Given(/^I fill in Password with abcdefghijk$/) do
  fill_in("Password", :with => "abcdefghijk ")
end

Given(/^I fill in Password_confirmation with abcdefghijk$/) do
  fill_in("user_password_confirmation", :with => "abcdefghijk ")
end

Given(/^I press “Sign up”$/) do
  click_button "Sign up"
end



Then(/^I should see a table$/) do
  pending
end 


