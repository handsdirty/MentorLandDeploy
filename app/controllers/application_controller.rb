class ApplicationController < ActionController::Base
  # In your controllers
  # before_filter :authenticate_user!, :except => [:some_action_without_auth]
  protect_from_forgery
  skip_before_filter :verify_authenticity_token, :if =>lambda{ params[:authenticity_token].present? && params[:authenticity_token] == 'YOUR_SECRET_TOKEN' }
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end 
end
