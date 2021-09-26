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

user1 = User.create(name: 'Justin Miller', 
  email: 'jayman1294@gmail.com', 
  password: 'password',
)
user1.avatar.attach(
  io: File.open('./public/profile_imgs/hacker.png'),
  filename: 'hacker.png',
  content_type: 'application/png'
)

user2 = User.create(name: 'Cynthia Smith-Miller',
  email: 'amma841@aol.com',
  password: 'password2',
)

mentor1 = Mentor.create(
  name: 'Justin Miller', 
  title: 'Software Engineer', 
  avatar: 'https://images.app.goo.gl/WvfAC8zqRBkWyD517',
  city: 'New York', 
  age: '29',
  field: 'Tech',
  email: 'jay@1294'
) 

mentor2 = Mentor.create(
  name: 'Milly Velez', 
  title: 'Speech Pathologist', 
  avatar: 'https://images.app.goo.gl/WvfAC8zqRBkWyD517',
  city: 'New York', 
  age: '28',
  field: 'Healthcare',
  email: 'milly@1000'
) 


event1 = Event.create(name: "Meet Up",date: 'Tomorrow',time: "10:00 AM",description: "Event for members to meetup with mentors",location: "New York", likes: 17)


event1.image.attach(
  io: File.open('./app/assets/images/meetup.jpg'),
  filename: 'meetup.jpg',
  content_type: 'application/jpg'
)

=begin booking1 = Booking.create(date: 'today', user: user1, mentor: mentor1)
booking2 = Booking.create(date: 'today', user: user1, mentor: mentor2) 
=end


appointment1 = Appointment.create(time: "12:00PM", day: "Wednesday", user: user1, mentor: mentor1)
appointment2 = Appointment.create(time: "1:00PM", day: "Saturday", user: user1, mentor: mentor1)
