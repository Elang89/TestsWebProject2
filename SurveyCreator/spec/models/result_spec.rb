require 'rails_helper'

RSpec.describe Result, type: :model do
  before(:each) do 
		@user = User.create!(email: "email@gmail.com", password: "password")
		@survey = Survey.create!(name: "Survey", user_id: @user.id)
		@question = Question.new(question_content: "What is your answer to that?", survey_id: @survey.id)
	end 

	it "creates a valid answer to a survey" do
		result = Result.create!(survey_id: @survey.id)
		expect(result).not_to be_nil
		expect(result).to be_valid
	end

	it "refuses an answer question" do 
		result = Result.create!(survey_id: nil)
		expect(result.survey_id).to be_nil
		expect(result).not_to be_invalid
	end 
end
