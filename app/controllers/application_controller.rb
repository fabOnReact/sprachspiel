class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
	after_action :user_activity
	# after_filter :flash_to_headers

	# def flash_to_headers
	# 	# binding.pry
	#   return unless request.xhr?
	#   @messages = "You need to sign in to purchase items" unless user_signed_in?
	#   response.headers['X-Message'] = @messages  unless @messages.blank?
	#   flash.discard
	# end

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
