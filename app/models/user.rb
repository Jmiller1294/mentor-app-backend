class User < ApplicationRecord
  has_secure_password

  has_many :mentors
  has_many :events
  has_many :mentors through: :user_mentors

  validates_presence_of :email
  validates_uniqueness_of :email
end
