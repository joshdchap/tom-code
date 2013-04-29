require 'spec_helper'


describe ContactsController do

  describe "GET index" do
    it "creates an array of contacts" do
      Contact.destroy_all
      contact = FactoryGirl.create(:contact)
      get :index
      assigns(:contacts).should eq([contact])
    end

    it "renders the :index view" do
      get :index
      response.should render_template :index
    end
  end

  describe "GET #show" do
    it "assigns the requested contact to @contact" do
      contact = FactoryGirl.create(:contact)
      get :show, id: contact
      assigns(:contact).should eq(contact)
    end
    it "renders the :show template" do
      get :show, id: FactoryGirl.create(:contact)
      response.should render_template :show
    end
  end
  
  describe "GET #new" do
    it "assigns a new Contact to @contact" do
      get :new
      assigns(:contact).should be_a_new(Contact)
    end
  end
  
end
