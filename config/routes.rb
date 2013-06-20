Spree::Core::Engine.routes.draw do
  namespace :admin do
    resource :postal_code_settings, :only => ['show', 'update', 'edit']
  end
end
