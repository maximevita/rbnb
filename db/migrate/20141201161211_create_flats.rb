class CreateFlats < ActiveRecord::Migration
  def change
    create_table :flats do |t|
      t.integer :price_per_day
      t.text :address
      t.text :description
      t.string :type
      t.integer :capacity
      t.string :title
      t.references :user, index: true

      t.timestamps
    end
  end
end
