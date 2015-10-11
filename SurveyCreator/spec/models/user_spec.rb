require 'rails_helper'
require 'spec_helper'

describe User, type: :model do

  	it 'creates a user with an email and a password' do
  		user = User.create!(:email => "email@gmail.com", :password => "password")
  		expect(user.email).to eq("email@gmail.com")
  		expect(user.password).to eq("password")
	end

	it "validates that both the email and password are not blank" do 
		expect(user = User.create(:email => "", :password => "")).to be_invalid
		expect(user = User.create(:email => "", :password => "password")).to be_invalid
		expect(user = User.create(:email => "email@gmail.com", :password => "")).to be_invalid
	end

end
