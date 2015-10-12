require 'rails_helper'

RSpec.describe "results/edit", type: :view do
  before(:each) do
    @result = assign(:result, Result.create!(
      :survey => nil,
      :index => "MyString",
      :new => "MyString",
      :create => "MyString"
    ))
  end

  it "renders the edit result form" do
    render

    assert_select "form[action=?][method=?]", result_path(@result), "post" do

      assert_select "input#result_survey_id[name=?]", "result[survey_id]"

      assert_select "input#result_index[name=?]", "result[index]"

      assert_select "input#result_new[name=?]", "result[new]"

      assert_select "input#result_create[name=?]", "result[create]"
    end
  end
end
