Deface::Override.new(
:virtual_path => 'spree/shared/_header',
:name => 'add_link_to_change_postal_code',
:insert_top => '#cart-bar',
:text => "
<li>
<% if cookies['postal_code_restrictions_postal_code'] %>
  <%= link_to I18n.t('spree.postal_code_restriction.change_postal_code'), '/postal_code_restrictions/' %>
<% end %>
</li>
"
)

