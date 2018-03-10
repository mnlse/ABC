class AddLocationToAdvertisements < ActiveRecord::Migration[5.1]
  def change
    add_column :advertisements, :city, :string
    add_column :advertisements, :voivodeship, :string
  end
end
