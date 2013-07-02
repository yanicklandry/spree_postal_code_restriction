module Spree::PostalCodeRestrictionsHelper
  
  include SpreePerlimCustomHelper if defined? SpreePerlimCustomHelper
  
  def validate_postal_code
    restricted_postal_codes = Spree::PostalCodeConfiguration.new.restricted_postal_codes
    
    if (defined?(retailer?) and retailer?(spree_current_user)) or restricted_postal_codes.nil?
      true
    else
      
      postal_code_to_validate = nil
      if(spree_current_user)
        postal_code_to_validate = spree_current_user.postal_code
        if postal_code_to_validate.nil?
          flash[:notice] = I18n.t("spree.postal_code_restriction.please_enter_postal_code")
          redirect_to "/#{locale_string}/account/edit"
          return nil
        end
      else
        postal_code_to_validate = cookies['postal_code_restrictions_postal_code']
        if postal_code_to_validate.nil?
          redirect_to "/postal_code_restrictions/"
          return nil
        end
      end
      
      postal_code_to_validate = parse_postal_code postal_code_to_validate
      restricted_postal_codes.split("\r\n").all? do |restricted|
        !Regexp.new(restricted).match(postal_code_to_validate)
      end
      
    end
  end

  def locale_string
    I18n.locale.to_s.split('-')[0].downcase
  end

  def parse_postal_code postal_code
    postal_code ? postal_code.delete(' ').upcase : nil
  end

  def postal_code_formatted? postal_code
    /[A-Z]\d[A-Z]\d[A-Z]\d/.match(parse_postal_code postal_code)
  end

end