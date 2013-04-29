require 'spec_helper'

describe "loans/show" do
  before(:each) do
    customer = stub_model(Contact, :firstname => "Client", :lastname => "One")
    agent = stub_model(Contact, :firstname => "Agent", :lastname => "Two")
    @loan = assign(:loan, stub_model(Loan, :customer => customer, :agent => agent))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
