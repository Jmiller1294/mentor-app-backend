class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :mentor

  validates_uniqueness_of :mentor_id, scope: :user_id
end
