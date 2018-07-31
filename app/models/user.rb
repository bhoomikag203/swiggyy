class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
    has_and_belongs_to_many :restaurants
  	has_many :orders
  	
	enum role: [:user, :restaurant_owner, :admin]
    devise  :database_authenticatable, :registerable,
            :rememberable, :trackable, :validatable,
            :omniauthable, omniauth_providers: [:google_oauth2]
end
