class Picture < ActiveRecord::Base
  belongs_to :flat
  has_attached_file :flat_image,
    styles: {
      medium: "300x300>",
      thumb: "100x100>"
    }

  validates_attachment_content_type :flat_image,
    content_type: /\Aimage\/.*\z/
end
