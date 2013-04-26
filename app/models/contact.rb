class Contact < ActiveRecord::Base

  CLIENT = "Client"
  PROSPECT = "Prospect"
  REFERRAL_PARTNER = "Referral Partner"
  CONTACT_TYPES = [CLIENT, PROSPECT, REFERRAL_PARTNER]

  has_many :cobrand_contacts, :class_name => "Contact", :foreign_key => "cobrand_id"
  belongs_to :cobrand, :class_name => "Contact"

  validates_presence_of :firstname
  validates_presence_of :lastname
  
  validates :contact_type, :inclusion => { :in => CONTACT_TYPES,
    :message => "%{value} is not a valid type"}

  validate :cobrands_can_only_be_referral_partners

  scope :referral_partners, where(:contact_type => REFERRAL_PARTNER)

  def self.lonely_agents
   referral_partners.select{|t| t if t.cobrand_contacts.blank?}
  end

  def cobrands_can_only_be_referral_partners
    if !cobrand.blank? && cobrand.contact_type != REFERRAL_PARTNER
      errors.add(:cobrand, "Can only be of type #{REFERRAL_PARTNER}")
    end
  end

  def name 
    self.firstname + " " + self.lastname
  end

end
