require 'spec_helper'

describe "contacts/new" do
  before(:each) do
    assign(:contact, stub_model(Contact).as_new_record)
    assign(:valid_cobrands, [stub_model(Contact, :firstname => "Josh", 
      :lastname => "Chapman")])
    assign(:valid_types, Contact::CONTACT_TYPES)
  end

  it "renders new contact form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", contacts_path, "post" do
    end
  end
end
