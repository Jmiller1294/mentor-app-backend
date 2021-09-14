class Registration < ApplicationRecord
  validates_presence_of :email, :name, :password
  validates_uniqueness_of :email, :password
end
