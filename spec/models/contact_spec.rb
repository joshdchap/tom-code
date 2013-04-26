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
  it "is invalid with an improper cobrand"
  it "is invalid without a type" do
    FactoryGirl.build(:contact, contact_type: nil).should_not be_valid
  end
  describe "cobrand association" do

    before :each do
      @miller = FactoryGirl.create(:contact, lastname: "Miller")
      @rogers = FactoryGirl.create(:contact, lastname: "Rogers", cobrand: @miller)
      @chapman = FactoryGirl.create(:contact, lastname: "Chapman")
    end

    it { should belong_to(:cobrand) }

    it "sets the cobrand properly" do
      @rogers.cobrand.should == @miller
    end
  end
end
