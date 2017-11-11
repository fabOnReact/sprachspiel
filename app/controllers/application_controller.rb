class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
	after_action :user_activity

	def after_sign_in_path_for(resource)
	  buildings_path
	end

	private
	
	def user_activity
	  current_user.try :touch
	end	
end
