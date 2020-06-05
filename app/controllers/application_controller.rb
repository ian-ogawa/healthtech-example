class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?
	before_action :check_doctors_opening_time

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :role, :opening, :closing])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :opening, :closing])
  end

  def check_doctors_opening_time
  	if current_user.try(:role).eql?('doctor')
  		flash[:alert] = "Please set opening time." if current_user.opening.nil?
  	end
  end
end
