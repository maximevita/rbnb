class RemoveDatesFromBookings < ActiveRecord::Migration
  def change
    remove_column :bookings, :starts_at, :date
    remove_column :bookings, :ends_at, :date
  end
end
