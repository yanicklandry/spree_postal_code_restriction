Deface::Override.new(:virtual_path => "spree/shared/_user_form",
:name => "add_postal_code_to_user_form",
:insert_bottom => "[data-hook='signup_below_password_fields']",
:text => '
  <p>
    <%= f.label :postal_code, I18n.t("spree.postal_code_restriction.postal_code") %><br />
    <%= f.text_field :postal_code %>
  </p>
')

# Deface::Override.new(:virtual_path => "spree/shared/_user_form",
# :name => "add_postal_code_to_user_form",
# :insert_bottom => "[data-hook='signup_below_password_fields']",
# :text => '
#   <p>
#     <%= f.label :postal_code, I18n.t("spree.postal_code_restriction.postal_code") %><br />
#     <%= f.text_field :postal_code %>
#   </p>
#   <p>
#     <%= f.check_box :is_not_canadian %>
#     <%= f.label :is_not_canadian, I18n.t("spree.postal_code_restriction.not_canadian") %>
#   </p>
# ')

Deface::Override.new(:virtual_path => "spree/users/show",
:name => "add_postal_code_to_user_show",
:insert_bottom => "[data-hook='account_summary']",
:text => '
<dl>
  <dt><%= I18n.t("spree.postal_code_restriction.postal_code") %></dt>
  <dd><%= @user.postal_code %> (<%= link_to t(:edit), spree.edit_account_path %>)</dd>
</dl>
')
