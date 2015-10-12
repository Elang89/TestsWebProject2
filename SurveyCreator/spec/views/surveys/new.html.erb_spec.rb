require 'rails_helper'
require 'spec_helper'

describe "surveys/new.html.erb", type: :view do
  before(:each) do
    assign(:survey, Survey.new(
      :name => "MyString"
    ))
  end

  it "renders new survey form" do
    render
    expect(rendered).to have_selector('form')
    expect(rendered).to have_link('Back', href: surveys_path)
  end
end
