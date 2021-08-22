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
  email: 'Jayman1294@gmail.com', 
  password: 'password'
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

event1 = Event.create(name: "Meet Up",date: 'Tomorrow',time: "11:00 AM",description: "Event for members to meetup with mentors",location: "New York", likes: 0)
event2 = Event.create(name: "Networking", date: 'Today', time: "12:00 PM", description: "Grab some drinks and meet with other professionals anbd mentors", location: "Atlanta", likes: 0)
event3 = Event.create(name: "Meet Up",date: 'Wed',time: "11:00 AM",description: "Meetup with mentors",location: "New York", likes: 0)
event4 = Event.create(name: "Info Session", date: 'Thurs', time: "12:00 PM", description: "Info session on programs we offer", location: "Atlanta", likes: 0)
event5 = Event.create(name: "Counseling",date: 'Fri',time: "11:00 AM",description: "Free counseling",location: "New York", likes: 0)
event6 = Event.create(name: "Meet and Greet", date: 'Today', time: "12:00 PM", description: "Grab some drinks and meet with other professionals anbd mentors", location: "Atlanta", likes: 0)

booking1 = Booking.create(date: 'today', user: user1, mentor: mentor1)
booking2 = Booking.create(date: 'today', user: user1, mentor: mentor2)

attendance1 = Attendance.create(date: Time.now, user: user1, event: event1)
attendance2 = Attendance.create(date: Time.now, user: user1, event: event2)




