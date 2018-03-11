class Picture < ApplicationRecord
  belongs_to :pictureable, polymorphic: true, optional: true
  has_attached_file :image, styles: { original: "1280x700>", large: "1000x400>", medium: "640x480>", small: "400x400>" }
  validates_attachment :image, presence: true,
                       content_type: { content_type: %w(image/jpeg image/png image/gif) },
                       size: { in: 0..5.megabytes }
end
