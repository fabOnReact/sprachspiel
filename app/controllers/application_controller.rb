class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception

	def after_sign_in_path_for(resource)
	  buildings_path
	end

	private
	
	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:admin])
		devise_parameter_sanitizer.permit(:account_update, keys: [:admin])
	end	
end
