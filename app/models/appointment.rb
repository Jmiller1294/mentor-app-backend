class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :mentor
  validates_presence_of :day, :time
end
