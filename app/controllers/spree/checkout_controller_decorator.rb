Spree::CheckoutController.class_eval do
  include Spree::BaseHelper
  alias_method :old_before_delivery, :before_delivery
  
  def before_delivery
    old_before_delivery
    validate_postal_code_before_delivery
  end
  
  def validate_postal_code_before_delivery
    if !( postal_code_not_in_restricted? @order.shipping_address.zipcode )
      flash[:retailer] = I18n.t("spree.postal_code_restriction.shop_online")
      redirect_to "/#{locale_string}/detaillants"
      return
    end
  end
  
end
