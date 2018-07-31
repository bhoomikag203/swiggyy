class Order < ApplicationRecord
	belongs_to :user
	belongs_to :restaurant
	has_many :meals
	enum :status[:Received, :Processing, :Comppleted]
end
