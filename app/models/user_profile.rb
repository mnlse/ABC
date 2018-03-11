class UserProfile < ApplicationRecord
  belongs_to :user
  has_attached_file :avatar_image
  has_attached_file :background_image

  validates_attachment :avatar_image,
    content_type: { content_type: %w(image/jpeg image/png image/jpg) },
    styles: { original: '600x600>', medium: '400x400>' },
    size: { in: 0..5.megabytes }

  validates_attachment :background_image,
    content_type: { content_type: %w(image/jpeg image/png image/jpg) },
    styles: { original: '1920x1080>', medium: '1280x720>' },
    size: { in: 0..5.megabytes }

end
