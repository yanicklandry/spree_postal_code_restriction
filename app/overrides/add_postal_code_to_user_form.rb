Deface::Override.new(:virtual_path => "spree/shared/_user_form",
:name => "add_postal_code_to_user_form",
:insert_bottom => "[data-hook='signup_below_password_fields']",
:text => '
  <p>
    <%= f.label :postal_code, I18n.t("spree.postal_code_restriction.postal_code") %><br />
    <%= f.text_field(:postal_code,  :value => @postal_code) %>
    
  </p>
')
