
require 'faker'
require "open-uri"

def handle_string_io_as_file(io)
  return io unless io.class == StringIO
  file = Tempfile.new(["temp",".png"], encoding: 'ascii-8bit')
  file.binmode
  file.write io.read
  file.open
end

Industry.destroy_all

puts 'Creating Industries'

industries_array = ["Health Care", "Industrial Design", "Financing", "Engineering", "Hospitality", "Management", "Education", "Sports", "Wev-development"]

industries_array.map { |industry_name| puts Industry.create(name: industry_name ) }

puts 'Finished creating Industries'

puts "Destroying users"
User.destroy_all
puts 'Creating Bob'

user_bob = User.new(
    first_name: "Bob",
    last_name: Faker::Name.last_name,
    age: rand(30..50),
    city: Faker::Address.city,
    phone_number: Faker::PhoneNumber.cell_phone,
    about: Faker::Quote.matz,
    email: "bob@email.com",
    password: "123456"
  )
UserIndustry.create(industry: Industry.all.sample, user: user_bob, work_experience: "Skilled" )
user_bob.save!

puts 'Finished creating Bob'


puts 'Creating users'

counter = 0

5.times do | index |
  user = User.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    age: rand(30..50),
    city: Faker::Address.city,
    phone_number: Faker::PhoneNumber.cell_phone,
    about: Faker::Quote.matz,
    email: Faker::Internet.email,
    password: Faker::Internet.password
  )
  user.save!
  UserIndustry.create(industry: Industry.all.sample, user: user, work_experience: "Skilled" )
end

user_one = User.first
# img_user = open("https://images.unsplash.com/photo-1560250097-0b93528c311a?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=2734&q=80")
# user_one.photo.attach(io: handle_string_io_as_file(img_user), filename: "images-first.png", content_type: 'image/png')
3.times do |index|
  Availability.create(
    mentor_id: user_one.id,
    slot: Date.today+rand(10000)
    )
end
user_one_industry = UserIndustry.create(user_id: user_one.id, industry_id: Industry.all.sample)

puts "Creating 3 availabilities for user 2"

user_two = User.second
# user_two.photo.attach(io: URI.open("https://source.unsplash.com/800x450/?portrait"), filename: "images-two.png", content_type: 'image/png')
3.times do |index|
  Availability.create(
    mentor_id: user_two.id,
    slot: Date.today+rand(10000)
    )
end

puts "Creating 3 availabilities for user 3"

user_three = User.third
# user_three.photo.attach(io: URI.open("https://source.unsplash.com/800x450/?portrait"), filename: "images-three.png", content_type: 'image/png')
3.times do |index|
  Availability.create(
    mentor_id: user_three.id,
    slot: Date.today+rand(10000)
    )
end

puts "Creating 3 availabilities for user 4"

user_four = User.fourth
# user_four.photo.attach(io: URI.open("https://source.unsplash.com/800x450/?portrait"), filename: "images-four.png", content_type: 'image/png')
3.times do |index|
  Availability.create(
    mentor_id: user_four.id,
    slot: Date.today+rand(10000)
    )
end

puts "Creating 3 availabilities for user 5"

user_five = User.fifth
# user_five.photo.attach(io: URI.open("https://source.unsplash.com/800x450/?portrait"), filename: "images-five.png", content_type: 'image/png')
3.times do |index|
  Availability.create(
    mentor_id: user_five.id,
    slot: Date.today+rand(10000)
    )
end

puts "Finishing seeding"
