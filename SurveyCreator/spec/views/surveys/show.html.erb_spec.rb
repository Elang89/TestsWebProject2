require 'rails_helper'

RSpec.describe "surveys/show.html.erb", type: :view do
	it 'displays product details correctly' do
    	assign(:survey, Survey.create(name: 'Shirt'))
    	render
    	expect(rendered).to match /Shirt/
  	end
end

