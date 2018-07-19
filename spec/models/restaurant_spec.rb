require 'rails_helper'

RSpec.describe Restaurant, :type => :model do
	let(:name){ "abc"}
	let(:phno){"9887846363"}
	let(:category){"veg"}
	let(:restaurant){Restaurant.new}
	context "validate the attributes of restaurant" do
		it{ is_expected.to validate_presence_of(:name)}
		#it{ is_expected.to validate_length_of(:name).is_at_most(51).with_message(/Name too big/)}
		it{ is_expected.to validate_presence_of(:phno)}
		it{ is_expected.to validate_presence_of(:category)}
	end
	
end