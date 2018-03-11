class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_attached_file :avatar_image, styles: { original: "300x300>", thumb: "100x100>" }, default_url: "/images/missing.png"
  validates_attachment :avatar_image, content_type: { content_type: %w(image/jpeg image/png image/jpg) }

  has_many :advertisements, dependent: :destroy
  has_one :user_profile, dependent: :destroy

  after_create :create_user_profile

  def create_user_profile
    user_profile = UserProfile.new
    user_profile.user_id = self.id
    user_profile.save
  end
end
