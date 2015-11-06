require 'rails_helper'

RSpec.describe User, type: :model do

	it 'should have a city' do
		user = User.create(name: Faker::Name.name, email: Faker::Internet.email, 
											 password: 'password', password_confirmation: 'password', 
											 address: Faker::Address.street_address, phone: Faker::PhoneNumber.cell_phone)
		expect(user.errors.full_messages).to include("City can't be blank")
	end
end
