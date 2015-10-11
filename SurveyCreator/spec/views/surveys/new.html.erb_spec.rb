require 'rails_helper'

RSpec.describe "surveys/new.html.erb", type: :view do
  before(:each) do
    assign(:survey, Survey.new(
      :name => "MyString"
    ))
  end

  it "renders new movie form" do
    render

    assert_select "form[action=?][method=?]", surveys_path, "post" do

      assert_select "input#survey_name[name=?]", "survey[name]"
    end
  end
end
