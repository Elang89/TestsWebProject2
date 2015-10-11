require 'rails_helper'
require 'spec_helper'

describe "devise/registrations/new", type: :view do
  
	it 'renders the page to create a user' do 
		render
		expect(rendered).to have_selector('form', count: 1)
		expect(rendered).to have_selector('label', text: 'Email')
		expect(rendered).to have_selector('label', text: 'Password')
		expect(rendered).to have_selector('label', text: 'Password confirmation')
		expect(rendered).to have_selector('.field', count: 3)
		expect(rendered).to have_selector('.actions')
		expect(rendered).to have_link('Log in', href: new_user_session_path)
	end

end
