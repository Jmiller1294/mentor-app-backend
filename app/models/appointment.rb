class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :mentor
  validates_presence_of :day, :time
  validates :day, uniqueness: { scope: :time,
    message: "You already have and appointment at this time" }
end
