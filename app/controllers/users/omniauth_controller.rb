class Users::OmniauthController < ApplicationController

	def google_oauth2 
		@user = User.create_from_google_data(request.env['omniauth.auth'])
		if @user.persisted?
			sign_in_and_redirect @user, event: :authentication
			set_flash_message(:notice, :success, kind: 'Google') if is_navigational_format?
		else
			redirect_to restaurants_path, :flash => {:error => 'There was a problem signing you in through Google. Please register or try signing in later.' }
		end
	end

	def failure
		puts ENV['omniauth.error'].inspect
	  	redirect_to new_user_registration_url, :flash => {:error => 'There was a problem signing you in. Please register or try signing in later.' }
	end

end
