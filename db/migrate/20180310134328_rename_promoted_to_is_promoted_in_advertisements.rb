class RenamePromotedToIsPromotedInAdvertisements < ActiveRecord::Migration[5.1]
  def change
    rename_column :advertisements, :promoted, :is_promoted
  end
end
