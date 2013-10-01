Deface::Override.new(:virtual_path => "spree/admin/users/_form",
:name => "add_postal_code_to_user_admin_form",
:insert_bottom => "[data-hook='admin_user_form_fields']",
:text => '

<%= f.field_container :postal_code do %>
  <%= f.label :postal_code, I18n.t("spree.postal_code_restriction.postal_code") %><br />
  <%= f.text_field :postal_code %>
  <%= error_message_on :user, :postal_code %>
<% end %>
')

