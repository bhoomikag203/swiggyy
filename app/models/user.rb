class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
    has_many :restaurants
    devise  :database_authenticatable, :registerable,
            :rememberable, :trackable, :validatable,
            :omniauthable, omniauth_providers: [:google_oauth2]
end
