class Restaurant < ApplicationRecord
	validates :name, presence: true, length: { maximum: 50 }
	validates :phno, presence: true, length: { maximum: 10 }
	validates :category, presence: true
	validates :rating, presence: true
	belongs_to :users
	has_many :meals
	enum role: [:user, :restaurant_owner, :admin]
end
