module DeviseWhitelist
  extend ActiveSupport::Concern
  
  included do
    before_filter :augment_permitted_params, if: :devise_controller?
  end
  
  private
  
    def augment_permitted_params
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name])
    end
end