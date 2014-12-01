class AddReviewToBookings < ActiveRecord::Migration
  def change
    add_column :bookings, :reveiw, :text
    add_column :bookings, :rating, :integer
  end
end
