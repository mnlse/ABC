class CreateUserProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :user_profiles do |t|
      t.references :user, foreign_key: true

      t.attachment :background_image
      t.attachment :avatar_image

      t.string :description
      t.string :profile_color
    end
  end
end
