require 'rails_helper'

RSpec.describe Answer, type: :model do
  	before(:each) do 
		@user = User.create!(email: "email@gmail.com", password: "password")
		@survey = Survey.create!(name: "Survey", user_id: @user.id)
		@question = Question.new(question_content: "What is your answer to that?", survey_id: @survey.id)
	end 

	it "creates a valid answer to a survey" do
		#question = Question.new(question_content: "What is your answer to that?", survey_id: @survey.id)
		#expect(question).not_to be_nil
		#expect(question).to be_valid
	end

	it "refuses an answer question" do 
		#question = Question.new(question_content:"", survey_id: @survey.id)
		#expect(question).not_to be_nil
		#expect(question).to be_invalid
	end 
end
