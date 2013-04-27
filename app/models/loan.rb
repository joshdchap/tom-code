class Loan < ActiveRecord::Base
  # attr_accessible :title, :body

  belongs_to :customer, :class_name => "Contact"
  belongs_to :agent, :class_name => "Contact"

  validate :agent_can_only_be_referral_partner

  def agent_can_only_be_referral_partner
    if !agent.blank? && agent.contact_type != Contact::REFERRAL_PARTNER
      errors.add(:agent, "Can only be of type #{Contact::REFERRAL_PARTNER}")
    end
  end  
end
