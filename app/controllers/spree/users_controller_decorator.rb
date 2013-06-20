Spree::UsersController.class_eval do
  prepend_after_filter :load_postal_code, :only => [:show, :edit]
  prepend_after_filter :set_postal_code, :only => [:update]
  
  def edit
    @postal_code = @user.preferred_postal_code
  end
  
  private
    def load_postal_code
      @postal_code = @user.preferred_postal_code
    end
    def set_postal_code
      @user.preferred_postal_code = params['user']['postal_code']
    end
end
