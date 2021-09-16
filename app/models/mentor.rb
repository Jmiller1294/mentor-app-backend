class Mentor < ApplicationRecord
  has_many :bookings
  has_many :appointments
  has_many :users, through: :bookings
  
end
