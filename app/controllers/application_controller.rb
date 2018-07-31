class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  def require_restaurant_owner(user_id)  #user_id is just a placeholder, can be xyz
    if current_user && (current_user == User.find(user_id))

    else
      redirect_to restaurants_path
    end
  end
end
