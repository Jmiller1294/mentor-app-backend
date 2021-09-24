class User < ApplicationRecord
  has_secure_password
  serialize :favorite_ids, Array

  has_many :bookings
  has_many :event_registrations
  has_many :appointments
  has_many :events, through: :event_registrations
  has_many :mentors, through: :bookings

  validates_confirmation_of :password
  validates :email, uniqueness: true
  validates :email, presence: true
  validates :name, presence: true
  validates :password, presence: true
  validates :name, length: { minimum: 5 }
  validates :email, length: { minimum: 10 }
  validates :password, length: { in: 6..20 }

end
