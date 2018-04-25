class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
	after_action :user_activity

	# def authenticate_user! 
	# 	super
	# 	unless request.xhr?
	#   	response.headers['X-Message'] = "You need to log in"  unless @messages.blank?
	#   	flash.discard
	#   end
	# end

	def after_sign_in_path_for(resource)
	  new_purchase_path
	end

	private	
	def user_activity
	  current_user.try :touch
	end	
end
