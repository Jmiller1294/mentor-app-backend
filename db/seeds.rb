# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

User.create(name: 'Justin Miller', email: 'Jayman1294@gmail.com', password: 'password')


100.times do 
  Mentor.create(
    name: Faker::Name.name,
    title: Faker::Job.title,
    field: Faker::Job.field
  )
end


