require 'rails_helper'

RSpec.describe "results/new", type: :view do
  before(:each) do
    assign(:result, Result.new(
      :survey => nil,
      :index => "MyString",
      :new => "MyString",
      :create => "MyString"
    ))
  end

  it "renders new result form" do
    render

    assert_select "form[action=?][method=?]", results_path, "post" do

      assert_select "input#result_survey_id[name=?]", "result[survey_id]"

      assert_select "input#result_index[name=?]", "result[index]"

      assert_select "input#result_new[name=?]", "result[new]"

      assert_select "input#result_create[name=?]", "result[create]"
    end
  end
end
