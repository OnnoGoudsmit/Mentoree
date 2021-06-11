# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require "open-uri"

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

  puts "Creating user with picture number #{counter += 1}"

# file = URI.open('https://giantbomb1.cbsistatic.com/uploads/original/9/99864/2419866-nes_console_set.png')

  user.photo.attach(io: URI.open("https://source.unsplash.com/800x450/?portrait"), filename: "images-#{counter += 1}.png", content_type: 'image/png')
  user.save!

  3.times do |index|
    Availability.create(
      mentor_id: user.id,
      slot: Date.today+rand(10000)
      )
  end
end

puts 'Finished creating users'

puts "Destroying industries"

Industry.destroy_all

puts 'Creating Industries'

industries_array = ["Health Care", "Industrial Design", "Financing", "Engineering", "Hospitality", "Management", "Education", "Sports", "Wev-development"]

industries_array.map { |industry_name| puts Industry.create(name: industry_name ) }

puts 'Finished creating Industries'

puts 'Have fun!'

