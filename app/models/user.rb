class User < ApplicationRecord
  has_secure_password

  has_many :bookings
  has_many :event_registrations
  has_many :appointments
  has_many :events, through: :event_registrations
  has_many :mentors, through: :bookings

  validates_presence_of :email, :name, :password
  validates_uniqueness_of :email
end
