class Flat < ActiveRecord::Base
  belongs_to :user
  has_many :pictures
  has_many :bookings
  has_many :comments, through: :bookings
  has_many :users, through: :bookings
end
