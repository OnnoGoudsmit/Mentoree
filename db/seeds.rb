
require 'faker'
require "open-uri"

def handle_string_io_as_file(io)
  return io unless io.class == StringIO
  file = Tempfile.new(["temp",".png"], encoding: 'ascii-8bit')
  file.binmode
  file.write io.read
  file.open
end
# -------------------------- Destroy --------------------------- #

puts 'Destroying all industries'
Industry.destroy_all
puts 'Creating Industries'
industries_array = ["Agriculture", "Computer-science", "Education", "Financial services" "Health services", "Hospitality services", "Industrial Design", "Mechanical and electrical engineering", "Sports", "Web-development"]
industries_array.map { |industry_name| puts Industry.create(name: industry_name ) }
puts 'Finished creating Industries'

puts "Destroying users"
User.destroy_all


# -------------------------- Mentors --------------------------- #

puts 'Creating Mentor1'

mentor1 = User.new(
  first_name: "Thomas",
  last_name: "Crane",
  age: 41,
  city: "Rotterdam",
  phone_number: 3053454123,
  about: "Inquisitive, energetic computer science specialist skilled in leadership, with a strong foundation in math, logic, and cross-platform coding. Seeking to leverage solid skills in collaboration",
  email: "thomas@email.com",
  password: "123456"
  )

UserIndustry.create(industry: Industry.last, user: mentor1, work_experience: "Computer science graduate trained in C, C++, Ruby on Rails, HTML, CSS, PHP, MySQL, Java, JavaScript, Python, SQL, with an undergraduate degree." )
mentor1.save!

puts 'Finished creating Mentor1'

puts 'Creating Mentor2'

mentor2 = User.new(
  first_name: "Sascha",
  last_name: "Akman",
  age: 35,
  city: "Amsterdam",
  phone_number: 2233454123,
  about: "Built and maintained a working customer database, order system, and picking and packing system with MySQL, complete with error handling and data validation.",
  email: "sascha@email.com",
  password: "123456"
  )

UserIndustry.create(industry: Industry.last, user: mentor2, work_experience: "Created many working sales website with PHP, JavaScript, HTML, CSS, and MailChimp." )
mentor2.save!

puts 'Finished creating Mentor2'

puts 'Creating Mentor3'

mentor3 = User.new(
  first_name: "Brian",
  last_name: "Lyall",
  age: 51,
  city: "Paris",
  phone_number: 3057624123,
  about: "Developed full-stack web applications which processed, analyzed, and rendered data visually.",
  email: "brianx@email.com",
  password: "123456"
  )

UserIndustry.create(industry: Industry.last, user: mentor3, work_experience: "Operating Systems Architecture, Linux/Unix Programming, Usability in Website and Software Design, C++ Programming I & II, Web Page Development." )
mentor3.save!

puts 'Finished creating Mentor3'

puts 'Creating Mentor4'

mentor4 = User.new(
  first_name: "Miranda",
  last_name: "Shaffer",
  age: 45,
  city: "Berlin",
  phone_number: 309836123,
  about: "Energetic Adobe Certified Expert (ACE) web designer with 6+ years of experience. Seeking to enhance design excellence at Dujo International. Designed 5 responsive websites per month for Amphimia Global with 99% client satisfaction.",
  email: "miranda@email.com",
  password: "123456"
  )

UserIndustry.create(industry: Industry.last, user: mentor4, work_experience: "Adobe Creative Suite, HTML, CSS. Creates seamless UX and UI with creative but functional designs. Designed 10+ websites, including an ecommerce baseball hat sales site." )
mentor4.save!

puts 'Finished creating Mentor4'

mentors_array = [mentor1, mentor2, mentor3, mentor4]

# -------------------------- Mentor avatars --------------------------- #

puts "Creating avatars for mentors"
puts "Avatar Mentor 1"
mentor1 = User.first
mentor1.photo.attach(io: File.open('app/assets/images/mentor-thomas-crane.png'), filename: 'mentor-thomas-crane.png', content_type: 'image/png')
puts "Avatar Mentor 2"
mentor2 = User.second
mentor2.photo.attach(io: File.open('app/assets/images/mentor-sascha-akman.png'), filename: 'mentor-sascha-akman.png', content_type: 'image/png')
puts "Avatar Mentor 3"
mentor3 = User.third
mentor3.photo.attach(io: File.open('app/assets/images/mentor-brian-Lyall.png'), filename: 'mentor-brian-Lyall.png', content_type: 'image/png')
puts "Avatar Mentor 4"
mentor4 = User.fourth
mentor4.photo.attach(io: File.open('app/assets/images/mentor-miranda-shaffer.png'), filename: 'mentor-miranda-shaffer.png', content_type: 'image/png')

# -------------------------- Bob --------------------------- #

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

user_bob.photo.attach(io: File.open('app/assets/images/mentoree-illustration-6.png'), filename: 'mentoree-illustration-6.png', content_type: 'image/png')

UserIndustry.create(industry: Industry.first, user: user_bob, work_experience: "Skilled" )
user_bob.save!

puts 'Finished creating Bob'

# -------------------------- Mentorees --------------------------- #

puts 'Creating user_chris'

user_chris = User.new(
  first_name: "Chris",
  last_name: "Ayers",
  age: 25,
  city: "Lisboa",
  phone_number: 3053434523,
  about: "This is the about info of chris",
  email: "crhis@email.com",
  password: "123456"
  )

user_chris.photo.attach(io: File.open('app/assets/images/mentoree-testimonials-avatar1.png'), filename: 'mentoree-testimonials-avatar1.png', content_type: 'image/png')

UserIndustry.create(industry: Industry.all.sample, user: user_chris, work_experience: "This is the work experience of chris." )
user_chris.save!

puts 'Finished creating user_chris'

puts 'Creating user_taliyah'

user_taliyah = User.new(
  first_name: "Taliyah",
  last_name: "Sandoval",
  age: 28,
  city: "Amsterdam",
  phone_number: 3053434523,
  about: "This is the about info of Taliyah",
  email: "taliyah@email.com",
  password: "123456"
  )

user_taliyah.photo.attach(io: File.open('app/assets/images/mentoree-testimonials-avatar2.png'), filename: 'mentoree-testimonials-avatar2.png', content_type: 'image/png')

UserIndustry.create(industry: Industry.all.sample, user: user_taliyah, work_experience: "This is the work experience of Taliyah." )
user_taliyah.save!

puts 'Finished creating user_taliyah'

puts 'Creating user_joshua'

user_joshua = User.new(
  first_name: "Joshua",
  last_name: "Evans",
  age: 33,
  city: "Barcelona",
  phone_number: 3053434523,
  about: "This is the about info of joshua",
  email: "joshua@email.com",
  password: "123456"
  )

user_joshua.photo.attach(io: File.open('app/assets/images/mentoree-testimonials-avatar4.png'), filename: 'mentoree-testimonials-avatar4.png', content_type: 'image/png')

UserIndustry.create(industry: Industry.all.sample, user: user_joshua, work_experience: "This is the work experience of joshua." )
user_joshua.save!

puts 'Finished creating user_joshua'

puts 'Creating user_lorena'

user_lorena = User.new(
  first_name: "Lorena",
  last_name: "Segura",
  age: 33,
  city: "Lyon",
  phone_number: 3053434523,
  about: "This is the about info of lorena",
  email: "lorena@email.com",
  password: "123456"
  )

user_lorena.photo.attach(io: File.open('app/assets/images/mentoree-testimonials-avatar4.png'), filename: 'mentoree-testimonials-avatar4.png', content_type: 'image/png')

UserIndustry.create(industry: Industry.all.sample, user: user_lorena, work_experience: "This is the work experience of lorena." )
user_lorena.save!

puts 'Finished creating user_lorena'

puts 'Creating user_daniel'

# ------------------------------ Daniel ------------------ #

user_daniel = User.new(
  first_name: "Daniel",
  last_name: "Mendez",
  age: 31,
  city: "Amsterdam",
  phone_number: 3053434523,
  about: "This is the about info of daniel",
  email: "daniel@gmail.com",
  password: "123456"
  )

user_daniel.photo.attach(io: File.open('app/assets/images/mentoree-daniel.png'), filename: 'mentoree-daniel.png.png', content_type: 'image/png')

UserIndustry.create(industry: Industry.all.sample, user: user_daniel, work_experience: "This is the work experience of daniel." )
user_daniel.save!

#Review.create(content: "Extremely happy with my mentor meeting. It gave me a new perspective about my field.")

puts 'Finished creating user_daniel'

mentoree_array = [user_chris, user_taliyah, user_joshua, user_lorena]


# ---------------------- mentor availabilty, past meeting and reviews ----------------------- #

puts "Creating reviews array"

reviews = ["Extremely happy with my mentor meeting. It gave me a new perspective about my field.",
    "Meet up.",
    "Just finished my masters and I had no idea how to approach looking for a job in my field. My mentor gave me some good advice to start replying to openings.",
    "Glad I could finally have a chat the founder of a tech start-up. Considering doing that myself! Thank you tons.",
    "Amazing help. Helped me get a clear view on how to proceed with job hunting.",
    "Really happy with the advice. Now I can continue my careerpath with a clear view of the future."]

puts "Creating 3 future availabilities"

mentors_array.each do |mentor|
  3.times do |index|
    date = DateTime.now
    date.change(hour: rand(9..18))#.to_a.sample)
    Availability.create(
      mentor_id: mentor.id,
      slot: date + rand(14)
      )
  end

puts "Creating 3 past availabilities + past meeting + reviews"

  3.times do
    availability = Availability.create(
      mentor_id: mentor.id,
      slot: Date.today-rand(3)
      )
    past_meeting = Meeting.create(availability: availability, mentoree_id: mentoree_array.sample.id )
    Review.create(content: reviews.pop, meeting: past_meeting, rating: true) unless reviews.empty?
  end
end

puts "Creating 3 past meeting daniel"

past_availability_daniel = Availability.create(mentor_id: mentor1.id, slot: Date.today-rand(3))
past_meeting_daniel = Meeting.create(availability: past_availability_daniel, mentoree_id: user_daniel.id )


puts "💫 OMG Finishing seeding! 🌈"
