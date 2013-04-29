require 'spec_helper'

describe Loan do
  it "has a valid factory" do
    FactoryGirl.build(:loan).should be_valid
  end

  it { should belong_to :customer }
  it { should belong_to :agent }

  it "is invalid with an improper agent" do
    @agent = FactoryGirl.create(:contact)

    FactoryGirl.build(:loan, agent: @agent).should_not be_valid
  end 

  it "switches cobrand to loan agent" do
  end
  
end
