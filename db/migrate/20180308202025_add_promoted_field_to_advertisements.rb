class AddPromotedFieldToAdvertisements < ActiveRecord::Migration[5.1]
  def change
    add_column :advertisements, :promoted, :boolean
  end
end
