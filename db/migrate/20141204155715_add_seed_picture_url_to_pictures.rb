class AddSeedPictureUrlToPictures < ActiveRecord::Migration
  def change
    add_column :pictures, :seed_picture_url, :string
  end
end
