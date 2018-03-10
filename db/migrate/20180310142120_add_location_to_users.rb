class AddLocationToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :city_last_known, :string
    add_column :users, :country_last_known, :string
  end
end
