# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

BASE_URL = 'https://randomuser.me/api/' + 
'?results=2000&nat=us&inc=gender,name,email,location,dob,id,picture'
  
resp = RestClient.get(BASE_URL) 
json = JSON.parse(resp) 
  
json["results"].each do |mentor|
  Mentor.create(
    name: "#{mentor["name"]["first"]} #{mentor["name"]["last"]}", 
    title: Faker::Job.title, field: Faker::Job.field,
    avatar: mentor["picture"]["medium"], 
    city: mentor["location"]["city"], 
    email: mentor["email"], 
    age: mentor["dob"]["age"]
  )
end

user = User.create(name: 'Justin Miller', 
  email: 'Jayman1294@gmail.com', 
  password: 'password'
)






