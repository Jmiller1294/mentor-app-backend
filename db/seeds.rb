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

user2 = User.create(name: 'Cynthia Smith-Miller',
  email: 'amma841@aol.com',
  password: 'password2'
)

=begin mentor1 = Mentor.create(
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
=end

event1 = Event.create(name: "Meet Up",date: 'Tomorrow',time: "10:00 AM",description: "Event for members to meetup with mentors",location: "New York", likes: 17)
event2 = Event.create(name: "Networking", date: 'Today', time: "12:00 PM", description: "Grab some drinks and meet with other professionals anbd mentors", location: "Atlanta", likes: 45)
event3 = Event.create(name: "Meet Up",date: 'Aug 30',time: "11:00 AM",description: "Meetup with mentors",location: "New York", likes: 25)
event4 = Event.create(name: "Info Session", date: 'Aug 31', time: "1:00 PM", description: "Info session on programs we offer", location: "Atlanta", likes: 13)
event5 = Event.create(name: "Counseling",date: 'Sept 4',time: "10:00 AM",description: "Free counseling",location: "Chicago", likes: 5)
event6 = Event.create(name: "Meet and Greet", date: 'Sept 2', time: "2:00 PM", description: "Grab some drinks and meet with other professionals anbd mentors", location: "Atlanta", likes: 1)
event7 = Event.create(name: "Info Session",date: 'Sept 4',time: "7:00 AM",description: "Info session on programs we offer",location: "Los Angeles", likes: 33)
event8 = Event.create(name: "Brunch",date: 'Sept 3',time: "11:00 AM",description: "Come have brunch with fellow mentees and network and make friends",location: "Chicago", likes: 30)
event9 = Event.create(name: "Mini Golf",date: 'Aug 29',time: "3:00 PM",description: "Come play mini golf at this fun event hosted downtown",location: "Atlanta", likes: 10)
event10 = Event.create(name: "Meet Up",date: 'Sept 1',time: "9:00 AM",description: "Meetup with mentors",location: "New York", likes: 0)
event11 = Event.create(name: "Job Fair",date: 'Sept 1',time: "8:00 PM",description: "The biggest job fair in the city, Meet and talk with recruiters and company reps",location: "New York", likes: 20)
event12 = Event.create(name: "Career Day",date: 'Sept 3',time: "9:00 AM",description: "Find out about all the potential career paths that are available and in demand",location: "Chicago", likes: 59)
event13 = Event.create(name: "Meet Up",date: 'Today',time: "5:00 PM",description: "Meetup with potential mentors",location: "New York", likes: 31)
event14 = Event.create(name: "Mentor Panel",date: 'Tomorrow',time: "8:00 AM",description: "Our yearly panel where mentors give advice on how they got to where they are",location: "New York", likes: 10)
event15 = Event.create(name: "Brunch",date: 'Today',time: "12:00 PM",description: "Come eat and have a good time",location: "New York", likes: 12)
event16 = Event.create(name: "Info Session",date: 'Tomorrow',time: "11:00 AM",description: "Info session on programs we offer",location: "New York", likes: 10)


=begin booking1 = Booking.create(date: 'today', user: user1, mentor: mentor1)
booking2 = Booking.create(date: 'today', user: user1, mentor: mentor2) 
=end

event_registration1 = EventRegistration.create(date: Time.now,first_name: 'justin', last_name: 'miller', email: 'dfsdfsdfsd@gmail.com', phone_number: '918-444-2222', user: user1, event: event1)
appointment1 = Appointment.create(time: "12:00PM", day: "Wednesday", user: user1)
appointment2 = Appointment.create(time: "1:00PM", day: "Saturday", user: user1)
