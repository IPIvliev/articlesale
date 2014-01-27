class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  def after_sign_in_path_for(resource)
    # if current_user.role == "client" || current_user.role == "copy"
    	request.env['omniauth.origin'] || stored_location_for(resource) || "/users/#{current_user.id}"
	# else
		#"/admins/index"
	# end
  end

end