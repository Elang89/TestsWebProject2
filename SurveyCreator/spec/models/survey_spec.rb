require 'rails_helper'
require 'spec_helper'

RSpec.describe Survey, type: :model do
  	it 'creates a Survey with a valid name' do
  		survey = Survey.create!(:name => "los pollitos dicen")
  		expect(survey.name).to eq("los pollitos dicen")
	end
	it "validates the name field is not blank" do 
		expect(survey = Survey.create(:name => "")).to be_invalid
	end
end
