class Spree::Admin::PostalCodeSettingsController < Spree::Admin::BaseController

  def show
    @config = Spree::PostalCodeConfiguration.new
  end

  def edit
    @config = Spree::PostalCodeConfiguration.new
  end

  def update
    config = Spree::PostalCodeConfiguration.new

    params.each do |name, value|
      next unless config.has_preference? name
      config[name] = value
    end

    redirect_to admin_postal_code_settings_path
  end

end
