# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'
# User.destroy_all

puts 'Starting seed...'
5.times do
  user = User.new(
    username: Faker::Lorem.word,
    full_name: Faker::Name.unique.name,
    phone_number: Faker::PhoneNumber.phone_number,
    bio: Faker::Lorem.paragraph(sentence_count: 2),
    private: [true, false].sample,
    password: '123456'
  )
  user.email = Faker::Internet.email(name: user.username)
  user.photo_attach(io: file, )
  user.save!
  puts user
end
puts 'Seed done'
