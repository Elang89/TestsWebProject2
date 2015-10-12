require 'rails_helper'
require 'spec_helper'	

describe "surveys/index.html.erb", type: :view do

	before(:each) do
		@user = User.create!(email: "email@gmail.com", password: "password")
		sign_in @user
	end 

	context "unpublished surveys" do 
		before(:each) do 
    		assign(:surveys, [Survey.create!(name: "name", status: false, user_id: @user.id)])
		end

		it "renders a list of unpublished surveys that belong to a user" do
    		render
    		Survey.all.each do |survey|
    			expect(survey.user_id).to eq(@user.id)
    			expect(rendered).to have_selector("td", text: survey.name)
    		end 
    	end
	end 

	context "published surveys" do 
		before(:each) do 
			assign(:surveys, [Survey.create!(name: "name", status: true, user_id: @user.id)])
		end 

		it "does not render surveys that have already been published" do 
			render 
			Survey.all.each do |survey|
				expect(rendered).not_to have_selector('td', text: survey.name)
			end 
		end 
	end 
end
