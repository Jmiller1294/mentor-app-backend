class Mentor < ApplicationRecord
  has_many :users, through: :user_mentors
end
