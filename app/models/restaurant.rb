class Restaurant < ApplicationRecord
	validates :name, presence: true, length: { maximum: 50 }
	validates :phno, presence: true, length: { maximum: 10 }
	validates :category, presence: true
	validates :rating, presence: true
	has_and_belongs_to_many :users
end
