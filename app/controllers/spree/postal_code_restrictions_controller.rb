class Spree::PostalCodeRestrictionsController < Spree::BaseController
  include Spree::PostalCodeRestrictionsHelper
  
  def index
    @postal_code = cookies['postal_code_restrictions_postal_code']
  end
  
  def create
    postal_code = parse_postal_code params['postal_code']
    if(postal_code_formatted? postal_code)
      cookies['postal_code_restrictions_postal_code'] = postal_code
      redirect_to "/#{locale_string}/cart"
    else
      flash[:notice] = I18n.t("spree.postal_code_restriction.not_valid")
      render "index"
    end
  end
end
