# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.delete_all
Calendar.delete_all
Gig.delete_all
Invoice.delete_all
SetList.delete_all
Song.delete_all

10.times do 
    User.create(
        username: Faker::Internet.username, 
        password: Faker::Internet.password, 
        email: Faker::Internet.email, 
        admin: false,
    )
end

5.times do 
    User.create(
        username: Faker::Internet.username, 
        password: Faker::Internet.password, 
        email: Faker::Internet.email, 
        admin: true
    )
end

Calendar.create

20.times do 
    Gig.create(
        event_type: "rehearsal", 
        status: "pending", 
        street_address: Faker::Address.street_address, 
        secondary_address: Faker::Address.secondary_address, 
        city: Faker::Address.city, 
        state: Faker::Address.state, 
        zip: Faker::Address.zip, 
        start_time: DateTime.now - 3, 
        end_time: DateTime.now,
        client: Faker::Name.name,
        calendar_id: 1,
        title: Faker::Lorem.word
    )
end

10.times do 
    Invoice.create(
        amount: Faker::Commerce.price,
        description: Faker::Lorem.sentences,
        user_id: 1
    )
end

SetList.create(gig_id: 1)

10.times do 
    Song.create(
        title: Faker::Music::Phish.song, 
        artist: Faker::Music.band,
        set_list_id: 1
    )
end

puts "You have created a bunch of stuff"
