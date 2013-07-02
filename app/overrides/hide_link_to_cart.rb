Deface::Override.new(
:virtual_path => 'spree/shared/_header',
:name => 'add_link_to_change_postal_code',
:insert_top => '#cart-bar',
:text => "
<li>
<% if cookies['postal_code_restrictions_postal_code'] and !spree_current_user %>
  <%= link_to I18n.t('spree.postal_code_restriction.change_postal_code'), '/#{I18n.locale.to_s.split('-')[0].downcase}/postal_code_restrictions/' %>
<% end %>
</li>
"
)

Deface::Override.new(
:virtual_path => 'spree/shared/_login_bar',
:name => 'hide_link_to_cart',
:surround => '#link-to-cart',
:text => "
<% 
  if spree_current_user
    postal_code = spree_current_user.postal_code
  else
    postal_code = cookies['postal_code_restrictions_postal_code']
  end
  
  if !postal_code.nil? and !postal_code.empty?
    display_cart_link = validate_postal_code
  else 
    display_cart_link = true
  end
  
  if display_cart_link %>
    <%= render_original %>
  <% end %>
"
)

