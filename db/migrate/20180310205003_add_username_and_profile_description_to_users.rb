class AddUsernameAndProfileDescriptionToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :username, :string
    add_column :users, :profile_description, :text
  end
end
