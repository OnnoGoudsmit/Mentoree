
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

industries_array = ["Wev-development", "Health Care", "Industrial Design", "Finance", "Engineering", "Hospitality", "Management", "Education", "Sports"]

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
UserIndustry.create(industry: Industry.first, user: user_bob, work_experience: "Skilled" )
user_bob.save!

puts 'Finished creating Bob'


puts 'Creating Mentor1'

mentor1 = User.new(
  first_name: "Thomas",
  last_name: "Crane",
  age: rand(40..50),
  city: "Wagenaarstraat 307, 1093CN Amsterdam",
  phone_number: 3053454123,
  about: "Inquisitive, energetic computer science specialist skilled in leadership, with a strong foundation in math, logic, and cross-platform coding. Seeking to leverage solid skills in collaboration",
  email: "thomasc@email.com",
  password: "123456"
  )
UserIndustry.create(industry: Industry.first, user: mentor1, work_experience: "Computer science graduate trained in C, C++, Ruby on Rails, HTML, CSS, PHP, MySQL, Java, JavaScript, Python, SQL, with an undergraduate degree." )
mentor1.save!

puts 'Finished creating Mentor1'

puts 'Creating Mentor2'

mentor2 = User.new(
  first_name: "Alvaro",
  last_name: "Mcgee",
  age: rand(40..50),
  city: "Sonnenallee 51, Freistaat Bayern",
  phone_number: 2233454123,
  about: "Built and maintained a working customer database, order system, and picking and packing system with MySQL, complete with error handling and data validation.",
  email: "alvamc@email.com",
  password: "123456"
  )
UserIndustry.create(industry: Industry.first, user: mentor2, work_experience: "Created many working sales website with PHP, JavaScript, HTML, CSS, and MailChimp." )
mentor2.save!

puts 'Finished creating Mentor2'

puts 'Creating Mentor3'

mentor3 = User.new(
  first_name: "Pierre",
  last_name: "Cox",
  age: rand(40..50),
  city: "26 rue Pierre De Coubertin, Toulouse",
  phone_number: 3057624123,
  about: "Developed full-stack web applications which processed, analyzed, and rendered data visually.",
  email: "pierrecox@email.com",
  password: "123456"
  )
UserIndustry.create(industry: Industry.first, user: mentor3, work_experience: "Operating Systems Architecture, Linux/Unix Programming, Usability in Website and Software Design, C++ Programming I & II, Web Page Development." )
mentor3.save!

puts 'Finished creating Mentor3'

puts 'Creating Mentor4'

mentor4 = User.new(
  first_name: "Miranda",
  last_name: "Shaffer",
  age: rand(40..50),
  city: "Burgemeester Hermansstraat 131, 5021CP Tilburg",
  phone_number: 309836123,
  about: "Energetic Adobe Certified Expert (ACE) web designer with 6+ years of experience. Seeking to enhance design excellence at Dujo International. Designed 5 responsive websites per month for Amphimia Global with 99% client satisfaction.",
  email: "mishaffer@email.com",
  password: "123456"
  )
UserIndustry.create(industry: Industry.first, user: mentor4, work_experience: "Adobe Creative Suite, HTML, CSS. Creates seamless UX and UI with creative but functional designs. Designed 10+ websites, including an ecommerce baseball hat sales site." )
mentor4.save!

puts 'Finished creating Mentor4'


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
