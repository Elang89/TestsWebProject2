require 'rails_helper'

RSpec.describe "results/index", type: :view do
  before(:each) do
    assign(:results, [
      Result.create!(
        :survey => nil,
        :index => "Index",
        :new => "New",
        :create => "Create"
      ),
      Result.create!(
        :survey => nil,
        :index => "Index",
        :new => "New",
        :create => "Create"
      )
    ])
  end

  it "renders a list of results" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Index".to_s, :count => 2
    assert_select "tr>td", :text => "New".to_s, :count => 2
    assert_select "tr>td", :text => "Create".to_s, :count => 2
  end
end
