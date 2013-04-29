class Contact < ActiveRecord::Base
 
  CLIENT = "Client"
  PROSPECT = "Prospect"
  REFERRAL_PARTNER = "Referral Partner"
  CONTACT_TYPES = [CLIENT, PROSPECT, REFERRAL_PARTNER]

  has_many :cobrand_contacts, :class_name => "Contact", :foreign_key => "cobrand_id"
  belongs_to :cobrand, :class_name => "Contact"

  has_many :servicing_loans, :class_name => "Loan", :foreign_key => "agent_id"
  has_many :consuming_loans, :class_name => "Loan", :foreign_key => "customer_id"

  attr_accessible :firstname, :lastname, :contact_type, :cobrand_id

  validates_presence_of :firstname
  validates_presence_of :lastname
  
  validates :contact_type, :inclusion => { :in => CONTACT_TYPES,
    :message => "%{value} is not a valid type"}

  validate :cobrands_can_only_be_referral_partners

  scope :referral_partners, where(:contact_type => REFERRAL_PARTNER)

  #referral partners who are not cobranded on any other contact
  def self.lonely_agents
   referral_partners.select{|t| t if t.cobrand_contacts.blank?}
  end
  
  def check_update_cobrand(customer_id, agent_id)
    customer = Contact.find(customer_id)
    unless customer.cobrand_id == agent_id
      customer.cobrand_id = agent_id
      customer.save
    end
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
