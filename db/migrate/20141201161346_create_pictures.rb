class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :picture_url
      t.references :flat, index: true

      t.timestamps
    end
  end
end
