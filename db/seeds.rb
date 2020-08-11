# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'


User.destroy_all
Event.destroy_all
Attendance.destroy_all



5.times do 
    user = User.create(
        first_name: Faker::Movies::HarryPotter.character, 
        last_name: Faker::Movies::HarryPotter.spell, 
        description: Faker::Movies::HarryPotter.quote,
        email: Faker::Internet.email,
        encrypted_password: Faker::Lorem.word
    )
end

puts "20 users created"

20.times do
    event = Event.create(
        title: Faker::Movies::HarryPotter.book,
        start_date: Faker::Time.between(from: DateTime.now + 10, to: DateTime.now + 5000, format: :short),
        duration: rand(5..100)*5,
        description: Faker::Lorem.paragraph_by_chars(number: 300, supplemental: false),
        location: Faker::Address.city,
        price: rand(1..1000),
        host_id: User.all.sample.id
    )
    puts "Event #{event.title} is created"
end


50.times do 
    attendance = Attendance.create(
        guest_id: User.all.sample.id,
        event_id: Event.all.sample.id
    )

end

puts "Attendance in place"