require 'spec_helper'

describe "contacts/index" do
  before(:each) do
    assign(:contacts, [
      stub_model(Contact, :firstname => "Josh",
      :lastname => "Chapman"),
      stub_model(Contact, :firstname => "Test1",
      :lastname => "Test2")
    ])
  end

  it "renders a list of contacts" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
