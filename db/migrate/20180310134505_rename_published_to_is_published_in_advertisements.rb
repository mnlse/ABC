class RenamePublishedToIsPublishedInAdvertisements < ActiveRecord::Migration[5.1]
  def change
    rename_column :advertisements, :published, :is_published
  end
end
