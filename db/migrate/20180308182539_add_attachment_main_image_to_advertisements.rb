class AddAttachmentMainImageToAdvertisements < ActiveRecord::Migration[5.1]
  def self.up
    change_table :advertisements do |t|
      t.attachment :main_image
    end
  end

  def self.down
    remove_attachment :advertisements, :main_image
  end
end
