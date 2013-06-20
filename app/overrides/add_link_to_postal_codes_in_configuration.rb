Deface::Override.new(:virtual_path => "spree/admin/configurations/index",
:name => "add_link_to_postal_codes_in_configuration",
:insert_after => "[data-hook='admin_configurations_menu'], #admin_configurations_menu[data-hook]",
:text => "<tr>
<td><%= link_to I18n.t('spree.postal_code_restriction.title'), admin_postal_code_settings_path %></td>
<td><%= I18n.t('spree.postal_code_restriction.description') %></td>
</tr>")

Deface::Override.new(:virtual_path => "spree/admin/shared/_configuration_menu",
:name => "add_tab_to_postal_codes_in_configuration",
:insert_bottom => "[data-hook='admin_configurations_sidebar_menu'], #admin_configurations_sidebar_menu[data-hook]",
:text => "<li<%== ' class=\"active\"' if controller.controller_name == 'postal_code_settings' %>><%= link_to I18n.t('spree.postal_code_restriction.title'), admin_postal_code_settings_path %></li>")
