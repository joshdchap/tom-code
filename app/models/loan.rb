class Loan < ActiveRecord::Base
  attr_accessible :amount, :agent_id, :customer_id, :address

  belongs_to :customer, :class_name => "Contact"
  belongs_to :agent, :class_name => "Contact"

  validate :agent_can_only_be_referral_partner

  before_save :check_update_cobrand

  def agent_can_only_be_referral_partner
    if !agent.blank? && agent.contact_type != Contact::REFERRAL_PARTNER
      errors.add(:agent, "Can only be of type #{Contact::REFERRAL_PARTNER}")
    end
  end  

  def check_update_cobrand
    customer = Contact.find(self.customer_id)
    customer.check_update_cobrand(self.customer_id, self.agent_id)
  end
end
