require 'spec_helper'

describe "loans/new" do
  before(:each) do
    assign(:loan, stub_model(Loan).as_new_record)
    assign(:valid_agents, [stub_model(Contact, :firstname => "First", :lastname => "Last")])
  end

  it "renders new loan form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", loans_path, "post" do
    end
  end
end
