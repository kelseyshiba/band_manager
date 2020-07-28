Gig.find(1)
gig1 = _
gig1.start_time = DateTime.now + 1
gig1.end_time = DateTime.now + 1.15
gig1.save

Gig.find(2)
gig2 = _
gig2.start_time = DateTime.now + 2
gig2.end_time = DateTime.now + 2.15
gig2.save

Gig.find(3)
gig3 = _
gig3.start_time = DateTime.now + 3
gig3.end_time = DateTime.now + 3.15
gig3.save

Gig.find(4)
gig4 = _
gig4.start_time = DateTime.now + 4
gig4.end_time = DateTime.now + 4.15
gig4.save

Gig.find(5)
gig5 = _
gig5.start_time = DateTime.now + 5
gig5.end_time = DateTime.now + 5.15
gig5.save

Gig.find(6)
gig6 = _
gig6.start_time = DateTime.now + 6
gig6.end_time = DateTime.now + 6.15
gig6.save

Gig.find(7)
gig7 = _
gig7.start_time = DateTime.now + 7
gig7.end_time = DateTime.now + 7.15
gig7.save

Gig.find(8)
gig8 = _
gig8.start_time = DateTime.now + 8
gig8.end_time = DateTime.now + 8.15
gig8.save

Gig.find(9)
gig9 = _
gig9.start_time = DateTime.now + 9
gig9.end_time = DateTime.now + 9.15
gig9.save

Gig.find(10)
gig10 = _
gig10.start_time = DateTime.now + 10
gig10.end_time = DateTime.now + 10.15
gig10.save

Gig.find(11)
gig11 = _
gig11.start_time = DateTime.now + 11
gig11.end_time = DateTime.now + 11.15
gig11.save

Gig.find(12)
gig12 = _
gig12.start_time = DateTime.now + 12
gig12.end_time = DateTime.now + 12.15
gig12.save

Gig.find(13)
gig13 = _
gig13.start_time = DateTime.now + 13
gig13.end_time = DateTime.now + 13.15
gig13.save

Gig.find(14)
gig14 = _
gig14.start_time = DateTime.now + 14
gig14.end_time = DateTime.now + 14.15
gig14.save

Gig.find(15)
gig15 = _
gig15.start_time = DateTime.now + 15
gig15.end_time = DateTime.now + 15.15
gig15.save

Gig.find(16)
gig16 = _
gig16.start_time = DateTime.now + 16
gig16.end_time = DateTime.now + 16.15
gig16.save

Gig.find(17)
gig17 = _
gig17.start_time = DateTime.now + 17
gig17.end_time = DateTime.now + 17.15
gig17.save

Gig.find(18)
gig18 = _
gig18.start_time = DateTime.now + 18
gig18.end_time = DateTime.now + 18.15
gig18.save

Gig.find(19)
gig19 = _
gig19.start_time = DateTime.now + 19
gig19.end_time = DateTime.now + 19.15
gig19.save

Gig.find(20)
gig20 = _
gig20.start_time = DateTime.now + 20
gig20.end_time = DateTime.now + 20.15
gig20.save


GigsUser.create(user_id: 1, gig_id: 1)
GigsUser.create(user_id: 2, gig_id: 1)
GigsUser.create(user_id: 3, gig_id: 1)
GigsUser.create(user_id: 4, gig_id: 1)
GigsUser.create(user_id: 5, gig_id: 1)
GigsUser.create(user_id: 6, gig_id: 2)
GigsUser.create(user_id: 7, gig_id: 2)
GigsUser.create(user_id: 8, gig_id: 2)
GigsUser.create(user_id: 9, gig_id: 2)
GigsUser.create(user_id: 10, gig_id: 2)
GigsUser.create(user_id: 11, gig_id: 3)
GigsUser.create(user_id: 12, gig_id: 4)
GigsUser.create(user_id: 13, gig_id: 5)
GigsUser.create(user_id: 14, gig_id: 6)
GigsUser.create(user_id: 15, gig_id: 7)
GigsUser.create(user_id: 1, gig_id: 8)
GigsUser.create(user_id: 11, gig_id: 9)
GigsUser.create(user_id: 8, gig_id: 10)
GigsUser.create(user_id: 9, gig_id: 11)
GigsUser.create(user_id: 15, gig_id: 12)
GigsUser.create(user_id: 14, gig_id: 13)
GigsUser.create(user_id: 15, gig_id: 14)
GigsUser.create(user_id: 11, gig_id: 15)
GigsUser.create(user_id: 12, gig_id: 16)
GigsUser.create(user_id: 10, gig_id: 17)
GigsUser.create(user_id: 9, gig_id: 18)
GigsUser.create(user_id: 9, gig_id: 19)
GigsUser.create(user_id: 9, gig_id: 20)


User.find(1)
user1 = _
user1.name = Faker::Name.name
user1.instrument = "trombone"
user1.save

i = 1
loop do
    user = User.find(i)
    user.name = Faker::Name.name
    user.instrument = Faker::Music.instrument
    user.save
    i += 1
    if i == 16
        break
    end
end