User.destroy_all
Listing.destroy_all
Message.destroy_all

10.times do
	User.create!(name: Faker::Name.name, password: 'password', 
							password_confirmation: 'password', address: Faker::Address.street_address,
							phone: Faker::PhoneNumber.cell_phone, email: Faker::Internet.email, city: User.cities.sample)
end

User.all.each do |u|
	u.listings.create(title: Faker::Lorem.word, description: Faker::Lorem.paragraph, expiration_date: DateTime.now + 5.days, location: User.cities.sample)
	u.sent_messages.create(sender_id: u.id, recipient_id: rand(0..User.all.count), body: Faker::Lorem.paragraph, status: 'sent')
end

skills = [
	"hair dressing", "computer repair", "lawn mowing",
	"cleaning", "cooking", 

]