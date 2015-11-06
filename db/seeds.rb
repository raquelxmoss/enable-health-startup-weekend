10.times do
	User.create!(name: Faker::Name.name, password: 'password', 
							password_confirmation: 'password', address: Faker::Address.street_address,
							phone: Faker::PhoneNumber.cell_phone, email: Faker::Internet.email)
end

User.all.each do |u|
	u.skills.create(title: Faker::Lorem.word)
end