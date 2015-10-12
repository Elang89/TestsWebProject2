require 'rails_helper'
require 'spec_helper'

describe "surveys/show.html.erb", type: :view do
	
	it 'displays a survey with a list of questions' do
    	assign(:survey, Survey.create(name: 'Shirt'))
    	render
    	expect(rendered).to match /Shirt/
    	expect(rendered).to have_selector('ol')
  	end
end

