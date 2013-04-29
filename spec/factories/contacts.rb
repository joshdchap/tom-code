FactoryGirl.define do
  factory :contact do |f|
    f.firstname "Josh"
    f.lastname "Chapman"
    f.contact_type Contact::CLIENT
  end

  factory :invalid_contact, parent: :contact do |f|
    f.firstname nil
  end
end
