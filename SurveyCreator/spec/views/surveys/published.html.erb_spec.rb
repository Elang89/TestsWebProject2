require 'rails_helper'
require 'spec_helper'

describe "surveys/published", type: :view do
  it "should render a list of surveys available to answer" do 
  	user = User.create!(email: "email@gmail.com", password: "password")
  	assign(:surveys, [Survey.create!(name: "Name", status: true, user_id: user.id)])
  	render
  	Survey.all.each do |survey|
  		expect(rendered).to have_selector("td", text: survey.name)
  		expect(rendered).to have_link('Answer Survey', href: new_survey_result_path(survey))
  	end 
  end 
end
