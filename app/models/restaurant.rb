class Restaurant < ApplicationRecord
	validates :name, presence: true, length: { maximum: 50}
	validates :phno, :presence => true
	validates :catagory, :presence => true

end
