require 'spec_helper'

describe "loans/index" do
  before(:each) do
    client = stub_model(Contact, :firstname => "Client", :lastname => "One")
    agent = stub_model(Contact, :firstname => "Agent", :lastname => "Two")
    assign(:loans, [
      stub_model(Loan, :customer => client, :agent => agent),
      stub_model(Loan, :customer => client, :agent => agent)
    ])
  end

  it "renders a list of loans" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
