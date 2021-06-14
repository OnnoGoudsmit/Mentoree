# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require "open-uri"

def handle_string_io_as_file(io)
  return io unless io.class == StringIO
  file = Tempfile.new(["temp",".png"], encoding: 'ascii-8bit')
  file.binmode
  file.write io.read
  file.open
end

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

user_bob.save!

puts 'Finished creating Bob'

# puts 'Creating Mentors'

# mentor1 = User.new(
#   first_name: "Katherine",
#   last_name: "Mills",
#   age: rand(40..60),
#   city: "Wagenaarstraat 307, 1093CN Amsterdam",
#   phone_number: 305 0001 5678,
#   about: "Deep expertise and hands on experience with Web Applications and programming languages such as HTML, CSS, JavaScript, JQuery and API’s.",
#   email: "kathmills@email.com",
# )

# file = URI.open('https://images.unsplash.com/photo-1560250097-0b93528c311a?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=2734&q=80')
# mentor1.photo.attach(io: file, filename: 'mentor-1.png', content_type: 'image/png')

# mentor1.save!

# mentor2 = User.new(
#   first_name: "Trevor",
#   last_name: "Burgess",
#   age: rand(40..60),
#   city: "Spaklerweg 38, 1096BA Amsterdam",
#   phone_number: 305 3401 6678,
#   about: "Responsible for designing, coding and modifying websites, from layout to function and according to a client’s specifications.",
#   email: "trevor@email.com",
# )

# file = URI.open('https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2850&q=80')
# mentor2.photo.attach(io: file, filename: 'mentor-2.png', content_type: 'image/png')

# mentor2.save!

# mentor3 = User.new(
#   first_name: "Irene",
#   last_name: "Michelle",
#   age: rand(40..60),
#   city: "Langerstraat 21, 1015AK Amsterdam",
#   phone_number: 335 5501 5278,
#   about: "Security Principles, Object-Oriented Design, Web Services (REST/SOAP), Multimedia Content Development, API’s",
#   email: "iremichel@email.com",
# )

# file = URI.open('https://images.unsplash.com/photo-1573497019940-1c28c88b4f3e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2734&q=80')
# mentor3.photo.attach(io: file, filename: 'mentor-3.png', content_type: 'image/png')

# mentor3.save!

# mentor4 = User.new(
#   first_name: "Jack",
#   last_name: "Duncan",
#   age: rand(40..60),
#   city: "Buitenveldertselaan 184, 1081AC Amsterdam",
#   phone_number: 616 2231 4528,
#   about: "Secures web system by developing system access, monitoring, control and evaluation; establishing and testing disaster recovery policies and procedures; completing back-ups;and maintaining documentation.",
#   email: "jduncan@email.com",
# )

# file = URI.open('https://images.unsplash.com/photo-1504257432389-52343af06ae3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=3009&q=80')
# mentor4.photo.attach(io: file, filename: 'mentor-4.png', content_type: 'image/png')

# mentor4.save!


# puts 'Finished creating Mentors'


puts 'Creating users'

# images = %w(allef-vinicius-C_1jjFJioWg-unsplash.jpeg
# allison-griffith-Q76DPRQ3Ix0-unsplash.jpeg
# austin-wade-X6Uj51n5CE8-unsplash.jpeg
# charles-etoroma-95UF6LXe-Lo-unsplash.jpeg
# christian-buehner-DItYlc26zVI-unsplash.jpeg
# christina-wocintechchat-com-SJvDxw0azqw-unsplash.jpeg
# courtney-cook-TSZo17r3m0s-unsplash.jpeg
# dahiana-waszaj-XQWfro4LrVs-unsplash.jpeg
# dahiana-waszaj-Xbe20Z_DlDs-unsplash.jpeg
# ethan-haddox-NTjSR3zYpsY-unsplash.jpeg
# gregory-hayes-SCbycmUSAaE-unsplash.jpeg
# harps-joseph-tAvpDE7fXgY-unsplash.jpeg
# jack-finnigan-rriAI0nhcbc-unsplash.jpeg
# jonas-kakaroto-KIPqvvTOC1s-unsplash.jpeg
# matheus-ferrero-W7b3eDUb_2I-unsplash.jpeg
# michael-dam-mEZ3PoFGs_k-unsplash.jpeg
# michael-mims-fWWiaDox0BU-unsplash.jpeg
# roland-samuel-MZ5A24H1JqU-unsplash.jpeg
# shipman-northcutt-sgZX15Da8YE-unsplash.jpeg
# wes-hicks-4-EeTnaC1S4-unsplash.jpeg)

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
  UsersIndustry.create(industry: Industry.all.sample, user: user, work_experience: "Skilled" )


end

  puts "Creating user with picture number #{counter}"



user_one = User.first
# img_user = open("https://images.unsplash.com/photo-1560250097-0b93528c311a?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=2734&q=80")
# user_one.photo.attach(io: handle_string_io_as_file(img_user), filename: "images-first.png", content_type: 'image/png')
3.times do |index|
  Availability.create(
    mentor_id: user_one.id,
    slot: Date.today+rand(10000)
    )
end
# user_one.update!

user_two = User.second
# user_two.photo.attach(io: URI.open("https://source.unsplash.com/800x450/?portrait"), filename: "images-two.png", content_type: 'image/png')
3.times do |index|
  Availability.create(
    mentor_id: user_two.id,
    slot: Date.today+rand(10000)
    )
end
# user_two.update!

user_three = User.third
# user_three.photo.attach(io: URI.open("https://source.unsplash.com/800x450/?portrait"), filename: "images-three.png", content_type: 'image/png')
3.times do |index|
  Availability.create(
    mentor_id: user_three.id,
    slot: Date.today+rand(10000)
    )
end
# user_three.update!

user_four = User.fourth
# user_four.photo.attach(io: URI.open("https://source.unsplash.com/800x450/?portrait"), filename: "images-four.png", content_type: 'image/png')
3.times do |index|
  Availability.create(
    mentor_id: user_four.id,
    slot: Date.today+rand(10000)
    )
end
# user_four.update!

user_five = User.fifth
# user_five.photo.attach(io: URI.open("https://source.unsplash.com/800x450/?portrait"), filename: "images-five.png", content_type: 'image/png')
3.times do |index|
  Availability.create(
    mentor_id: user_five.id,
    slot: Date.today+rand(10000)
    )
end
# user_five.update!



puts 'Finished creating users'

puts "Destroying industries"

Industry.destroy_all

puts 'Creating Industries'

industries_array = ["Health Care", "Industrial Design", "Financing", "Engineering", "Hospitality", "Management", "Education", "Sports", "Wev-development"]

industries_array.map { |industry_name| puts Industry.create(name: industry_name ) }

puts 'Finished creating Industries'

puts 'Have fun!'

