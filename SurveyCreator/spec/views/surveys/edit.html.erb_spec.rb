require 'rails_helper'

describe "surveys/edit.html.erb", type: :view do
  
  before(:each) do
    @user = User.create!(email: "email@gmail.com", password: "password")
    sign_in @user
    @survey = Survey.create!(name: "Name", status: false, user_id: @user.id)
  end 
    

  it "renders the options to edit an unpublished survey" do
  	render
    expect(rendered).to have_selector('form')
  end
end
