class ApplicationController < ActionController::Base
	before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
  end

	private

  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(resource_or_scope)
    root_path
  end

  def after_sign_in_path_for(resource_or_scope)
  	dashboard_forms_path
    # if resource_or_scope == :user
    #   new_user_session_path
    # elsif resource_or_scope == :admin
    #   new_admin_session_path
    # else
      # root_path
    # end
  end
end