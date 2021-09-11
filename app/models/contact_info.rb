class ContactInfo < ApplicationRecord
  validates_presence_of :email, :name, :phone
  validates_uniqueness_of :email, :phone
end
