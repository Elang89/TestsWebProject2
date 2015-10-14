require 'rails_helper'
require 'spec_helper'

RSpec.describe Question, type: :model do
	before(:each) do 
		@user = User.create!(email: "email@gmail.com", password: "password")
		@survey = Survey.create!(name: "Survey", user_id: @user.id)
	end 

	it "creates a valid question tied to a survey" do
		question = Question.new(question_content: "What is your answer to that?", survey_id: @survey.id)
		expect(question).not_to be_nil
		expect(question).to be_valid
	end

	it "refuses an invalid question" do 
		question = Question.new(question_content:"", survey_id: @survey.id)
		expect(question).not_to be_nil
		expect(question).to be_invalid
	end 
end
