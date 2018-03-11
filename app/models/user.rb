class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  has_attached_file :avatar, styles: { original: "300x300>", thumb: "100x100>" }, default_url: "/images/missing.png"
  validates_attachment :avatar, content_type: { content_type: %w(image/jpeg image/png image/jpg) }

  has_many :advertisements, dependent: :destroy
end
