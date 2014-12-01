class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.date :begin_date
      t.date :end_date
      t.string :request_status
      t.references :flat, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
