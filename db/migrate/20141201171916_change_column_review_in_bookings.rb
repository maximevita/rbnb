class ChangeColumnReviewInBookings < ActiveRecord::Migration
  def change
    rename_column :bookings, :reveiw, :review
  end
end
