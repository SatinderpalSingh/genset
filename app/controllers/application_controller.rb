class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected 

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation) }
    devise_parameter_sanitizer.for(:sign_in)  { |u| u.permit(:username, :password, :remember_me) }
  end

  def after_sign_in_path_for(resources_or_scope)
    dashboard_path    
  end

  def after_sign_out_path_for(resources_or_scope)
    root_path
  end

end
