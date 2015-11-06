10.times do
	User.create(name: Faker::Name.name, password: 'password', 
							password_confirmation: 'password', address: Faker::Address.street_address,
							phone: Faker::PhoneNumber.cell_phone)
end

User.all.each do |u|
	u.skills.create(skill: Faker::Company.profession)
end