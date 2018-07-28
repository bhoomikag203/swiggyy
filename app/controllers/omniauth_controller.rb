class OmniauthController < ApplicationController
	skip_before_action :authenticate_user!

	def google_oauth2
	    auth = request.env["omniauth.auth"]
	    user = User.where(provider: auth["provider"], uid: auth["uid"])
	            .first_or_initialize(email: auth["info"]["email"] )
	    user.image = auth["info"]["image"]
	  	user.password = SecureRandom.urlsafe_base64(n=8)
	    user.save!

	    user.remember_me = true
	    sign_in(:user, user)

	    redirect_to restaurants_path
	end

	def failure
		flash[:error] = 'There was a problem signing you in. Please register or try signing in later.' 
		redirect_to new_user_registration_url
	end
end
