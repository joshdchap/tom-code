require 'spec_helper'

describe LoansController do

  describe "GET index" do
    it "assigns all loans as @loans" do
      loan = FactoryGirl.create(:loan)
      get :index
      assigns(:loans).should eq([loan])
    end
  end

  describe "GET show" do
    it "assigns the requested loan as @loan" do
      loan = FactoryGirl.create(:loan)
      get :show, id: loan
      assigns(:loan).should eq(loan)
    end
  end

  describe "GET new" do
    it "assigns a new loan as @loan" do
      get :new
      assigns(:loan).should be_a_new(Loan)
    end
  end

  describe "GET edit" do
    it "assigns the requested loan as @loan" do
      loan = FactoryGirl.create(:loan)
      get :edit, id: loan
      assigns(:loan).should eq(loan)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      customer = FactoryGirl.create(:contact)
      agent = FactoryGirl.create(:contact, :contact_type => Contact::REFERRAL_PARTNER)
      loan_attrs = FactoryGirl.attributes_for(:loan, :customer_id => customer.id,
                     :agent_id => agent.id)
      it "creates a new Loan" do
        expect {
          post :create, loan: loan_attrs
        }.to change(Loan, :count).by(1)
      end
    end

  end

end
