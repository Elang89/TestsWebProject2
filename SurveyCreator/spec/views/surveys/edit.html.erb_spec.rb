require 'rails_helper'

RSpec.describe "surveys/edit.html.erb", type: :view do
  
  before(:each) do
  	@survey = assign(:survey, Survey.create!(
  		name: "SurveyTest"))
  end

  it "renders the edit survey form" do
  	render
  	assert_select "form[action=?][method=?]",survey_path(@survey), "post" do
  		assert_select "input#survey_name[name=?]","survey[name]"
  	end
  end

end
