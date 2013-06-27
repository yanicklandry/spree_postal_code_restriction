Spree::User.class_eval do
  attr_accessible :postal_code, :is_not_canadian
  validate :postal_code_valid
  include Spree::PostalCodeRestrictionsHelper
  def postal_code_valid
    if(self.is_not_canadian)
      self.postal_code = ""
    else
      self.postal_code = parse_postal_code self.postal_code
      
      if(!postal_code_formatted? self.postal_code)
        errors.add(:postal_code, I18n.t("spree.postal_code_restriction.not_valid"))
      end
    end
  end
end
