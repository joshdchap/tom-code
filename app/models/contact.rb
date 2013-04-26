class Contact < ActiveRecord::Base

  CONTACT_TYPES = ["Client", "Prospect", "Referral Partner"]

  belongs_to :cobrand, :class_name => "Contact"

  validates_presence_of :firstname
  validates_presence_of :lastname
  
  validates :contact_type, :inclusion => { :in => CONTACT_TYPES,
    :message => "%{value} is not a valid type"}


end
