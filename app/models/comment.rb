class Comment < ActiveRecord::Base
  belongs_to :booking
  belongs_to :user
end
