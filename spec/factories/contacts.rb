FactoryGirl.define do
  factory :contact do |f|
    f.firstname "Josh"
    f.lastname "Chapman"
    f.contact_type Contact::CLIENT
  end

  factory :agent_contact do |f|
    f.firstname "Agent"
    f.lastname "Zero"
    f.contact_type Contact::REFERRAL_PARTNER
  end
end
