class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_filter :configure_devise_parameters, if: :devise_controller?

  
  
def times
end

protected
def configure_devise_parameters
  devise_parameter_sanitizer.for(:account_update) << :adult
end



end
