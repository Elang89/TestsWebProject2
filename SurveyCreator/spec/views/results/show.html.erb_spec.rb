require 'rails_helper'

RSpec.describe "results/show", type: :view do
  before(:each) do
    @result = assign(:result, Result.create!(
      :survey => nil,
      :index => "Index",
      :new => "New",
      :create => "Create"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Index/)
    expect(rendered).to match(/New/)
    expect(rendered).to match(/Create/)
  end
end
