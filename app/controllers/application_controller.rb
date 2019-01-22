class ApplicationController < ActionController::Base
<<<<<<< HEAD
	before_action :configure_permitted_parameters, if: :devise_controller?

	protected
	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
		devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
		devise_parameter_sanitizer.permit(:account_update, keys: [:name])
	end
=======
>>>>>>> origin/master
end
