class Booking < ActiveRecord::Base
  belongs_to :flat
  belongs_to :user
  has_many :comments
  has_many :users, through: :flats
end
