class User < ApplicationRecord
  has_secure_password
  serialize :favorite_ids, Array

  has_many :bookings
  has_many :event_registrations
  has_many :appointments
  has_many :events, through: :event_registrations
  has_many :mentors, through: :bookings
  has_one_attached :avatar

  validates_confirmation_of :password
  validates :email, uniqueness: true
  validates :email, presence: true, on: :create
  validates :email, length: { minimum: 10 }
  validates :name, presence: true, on: :create
  validates :name, length: { minimum: 5 }
  validates :password, presence: true, on: :create
  validates :password, length: { in: 6..20 }, on: :create
end
