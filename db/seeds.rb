# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require "open-uri"

puts "Destroying mentor"
User.destroy_all

puts "Creating Mentors/Mentorees"

20.times do
  user = User.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    age: rand(30..50),
    city: Faker::Address.city,
    phone_number: Faker::PhoneNumber.cell_phone,
    about: Faker::Quote.matz,
    email: Faker::Internet.email,
    resume: Faker::Markdown.emphasis,
    password: Faker::Internet.password
  )
  user.save!
end

puts 'Finished creating Mentors/Mentorees'

puts "Destroying industries"
Industry.destroy_all

puts "Creating Industries"

industry_array = ["Health Care", "Basic Materials", "Financials", "Utilities", "Telecommunications", "Financials", "Health Care", "Oil & Gas", "Industrials"];

puts 'Finished creating Industries'




