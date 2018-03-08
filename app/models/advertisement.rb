class Advertisement < ApplicationRecord
  belongs_to :category
  has_attached_file :main_image, styles: { large: "1280x700>", medium: "640x480>", small: "400x400>" }
  validates_attachment :main_image, presence: true,
                       content_type: { content_type: %w(image/jpeg image/png image/gif) },
                       size: { in: 0..5.megabytes }

  scope :recent, -> { where("created_at > ?", Time.now - 24.hours).limit(9).order("created_at DESC") }
  scope :promoted, -> { where(promoted: true).order("created_at DESC") }
  scope :published, -> { where(published: true) }

  def self.search(phrase:)
    where("lower(title) LIKE lower(?)", "%#{phrase}%")
  end
end
