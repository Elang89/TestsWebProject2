Given(/^I have no Surveys$/) do
	Survey.delete_all
end

Given(/^I am on the Surveys page$/) do
	visit "/surveys"
end

When(/^I press "New Survey"$/) do 
	click_link('New Survey')
end

When(/^I fill in "(.*?)" with "(.*?)"$/) do |arg1, arg2|
	fill_in(arg1, :with => arg2)
end
 
When(/^I press "Create Survey"$/) do 
	click_button('Create Survey')
end

Then(/^I should be redirected to Survey$/) do
  request.headers['HTTP_REFERER'].should_not be_nil
  request.headers['HTTP_REFERER'].should_not == request.request_uri
end 

Then(/^I should see "(.*?)"$/) do |arg1| 
	page.should have_content(arg1) 
end

Then(/^I should have ([0-9]) Survey$/) do |count| 
	expect(Survey.count).to eq(count.to_i) 
end 
