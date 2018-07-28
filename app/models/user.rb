class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

    belongs_to :restaurants, optional: true
    devise  :database_authenticatable, :registerable,
            :rememberable, :trackable, :validatable,
            :omniauthable, omniauth_providers: [:google_oauth2]
end
