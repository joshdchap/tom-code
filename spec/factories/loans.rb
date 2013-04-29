FactoryGirl.define do
  factory :loan do |f|
    f.amount 1000.0
    f.address "1900 Sill Ct. Testing, OK 12345"
    f.association :customer, factory: :contact
    f.association :agent, factory: :contact, contact_type: Contact::REFERRAL_PARTNER
  end
end
