require 'rails_helper'
require 'spec_helper'

describe "devise/sessions/new", type: :view do
	it "should render a form with inputs to allow the user to login" do
		render 
		expect(rendered).to have_selector("form")
		expect(rendered).to have_selector("label", text: "Email")
		expect(rendered).to have_selector("label", text: "Password")
		expect(rendered).to have_selector(".field", count: 3)
		expect(rendered).to have_selector(".actions")
		expect(rendered).to have_link('Sign up', href: new_user_registration_path)	
	end
end
