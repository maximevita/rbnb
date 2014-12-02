class AddAttachmentFlatImageToPictures < ActiveRecord::Migration
  def self.up
    change_table :pictures do |t|
      t.attachment :flat_image
    end
  end

  def self.down
    remove_attachment :pictures, :flat_image
  end
end
