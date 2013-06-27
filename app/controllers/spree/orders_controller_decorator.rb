Spree::OrdersController.class_eval do
  before_filter :validate_access_to_cart
  include Spree::PostalCodeRestrictionsHelper
  
  def validate_access_to_cart
    if validate_postal_code === false
      flash[:notice] = I18n.t("spree.postal_code_restriction.shop_online")
      redirect_to "/#{locale_string}/detaillants"
      return
    end
  end
  
end
