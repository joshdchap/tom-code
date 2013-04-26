require 'spec_helper'

describe Contact do
  it "has a valid factory" do
    FactoryGirl.create(:contact).should be_valid
  end
  
  it "is invalid without a firstname" do
    FactoryGirl.build(:contact, firstname: nil).should_not be_valid
  end

  it "is invalid without a lastname" do
    FactoryGirl.build(:contact, lastname: nil).should_not be_valid
  end

  it "is invalid with an improper cobrand" do
    client = FactoryGirl.create(:contact, contact_type: "Client")
    client2 = FactoryGirl.build(:contact, contact_type: "Client", 
                 cobrand: client).should_not be_valid
  end

  it "is invalid without a type" do
    FactoryGirl.build(:contact, contact_type: nil).should_not be_valid
  end

  it "returns full name" do 
    FactoryGirl.build(:contact).name.should == "Josh Chapman"
  end

  describe "cobrand association" do

    before :each do
      @miller = FactoryGirl.create(:contact, lastname: "Miller",
                  contact_type: Contact::REFERRAL_PARTNER)
      @rogers = FactoryGirl.create(:contact, lastname: "Rogers", cobrand: @miller)
      @chapman = FactoryGirl.create(:contact, lastname: "Chapman",
                  contact_type: Contact::REFERRAL_PARTNER)
    end
    context "setting and getting" do 
      it { should have_many(:cobrand_contacts) }
      it { should belong_to(:cobrand) }

      it "sets the cobrand properly" do
        @rogers.cobrand.should == @miller
      end

      it "finds the cobrand contacts properly" do
        @miller.cobrand_contacts.should == [@rogers]
      end
    end

    context "lonely agent scope" do
      it "returns lonely agents" do
        Contact.lonely_agents.should == [@chapman]
      end
    end
  end
end
