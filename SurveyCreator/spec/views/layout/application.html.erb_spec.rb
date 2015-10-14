require 'rails_helper'
require 'spec_helper'

describe "layouts/application", type: :view do
	it "should display a navbar with a list of links" do 
		render 
		expect(rendered).to have_selector('div')
		expect(rendered).to have_link("Create Account", href: new_user_registration_path)
		expect(rendered).to have_link("Log in", href: new_user_session_path)
	end

	it "should display certain menus is if the user is signed in" do 
		user = User.create(:email => 'email@gmail.com', :password => 'password')
		sign_in user
		render 
		expect(user).not_to be_nil
		expect(rendered).to have_link("Create Survey", href: new_survey_path)
		expect(rendered).to have_link("Log out", href: destroy_user_session_path)
		expect(rendered).not_to have_link("Log in", href: new_user_session_path)
		expect(rendered).not_to have_link("Create Account", href: new_user_registration_path)
	end

	it "should hide certain menus if the user is not signed in" do
		render
		expect(rendered).not_to have_link('Log out', href: destroy_user_session_path)
		expect(rendered).not_to have_link("Create Survey", href: new_survey_path)
		expect(rendered).to have_link("Create Account", href: new_user_registration_path)
		expect(rendered).to have_link("Surveys", href: published_surveys_path)
		expect(rendered).to have_link("Log in", href: new_user_session_path)
	end
end
