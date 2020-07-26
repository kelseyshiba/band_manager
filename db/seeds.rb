# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do User.create(username: Faker::Internet.username , password: Faker::Internet.password ,  email: Faker::Internet.email ,  admin: false)
end

5.times do User.create(username: Faker::Internet.username, password: Faker::Internet.password, email: Faker::Internet.email, admin: true)
end

20.times do Gig.create(type: "rehearsal", status: "pending", street_address: Faker::Address.street_address, secondary_address: Faker::Address.secondary_address, city: Faker::Address.city, state: Faker::Address.state, zip: Faker::Address.zip, start_time: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now, end_time: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now)

10.times do Invoice.create(amount: Faker::Number.decimal(l_digits: 2), description: Faker::Lorem.sentences)

10.times do Song.create(title: Faker::Music::Phish.song, artist: Faker::Music.band)

10.times do SetList.create
10.times do Calendar.create

