class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def verify_admin
    unless user_signed_in? && current_user.admin?
      flash[:error] = "You have no power here!" 
      redirect_to root_url
    end
  end
end
