namespace :spree_postal_code_restriction do
  
  task :set_postal_code_if_none => :environment do
    desc "set the postal code for users who have none"
    include Spree::BaseHelper
    
    r = Spree::Role.find_by_name('retailer')
    Spree::User.where(:postal_code => nil).each do |u|
      if(!u.spree_roles.include?(r) and u.orders.any? and u.orders.last.ship_address)
        u.postal_code = parse_postal_code(u.orders.last.ship_address.zipcode)
        u.save
      end
    end
  end
end