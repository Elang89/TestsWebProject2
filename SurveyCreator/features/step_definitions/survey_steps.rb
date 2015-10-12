Given /^the following surveys:$/ do |surveys|
  Survey.create!(surveys.hashes)
end

When /^I delete the (\d+)(?:st|nd|rd|th) survey$/ do |pos|
  visit surveys_path
  within("table tr:nth-child(#{pos.to_i})") do
    click_link "Destroy"
  end
end

Then /^I should see the following surveys:$/ do |expected_surveys_table|

  rows = find("table").all('tr')
  table = rows.map { |r| r.all('th,td').map { |c| c.text.strip } }

  expected_surveys_table.diff!(table) 
end
