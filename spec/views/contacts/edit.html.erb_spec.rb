require 'spec_helper'

describe "contacts/edit" do
  before(:each) do
    @contact = assign(:contact, stub_model(Contact, :firstname => "Josh", 
                 :lastname => "Chapman"))
    assign(:valid_cobrands, [stub_model(Contact, :firstname => "Josh2",
      :lastname => "Chapman2")])
    assign(:valid_types, Contact::CONTACT_TYPES)
  end

  it "renders the edit contact form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", contact_path(@contact), "post" do
    end
  end
end
