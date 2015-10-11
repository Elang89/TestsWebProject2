require 'rails_helper'

RSpec.describe "surveys/index.html.erb", type: :view do
	before(:each) do
    	assign(:surveys, [Survey.create!(:name => "Name"),Survey.create!(:name => "Name")])
  	end
	it "renders a list of surveys" do
    	render
    	assert_select "tr>td", :text => "Name".to_s, :count => 2
    end
    
end
