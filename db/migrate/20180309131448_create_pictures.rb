class CreatePictures < ActiveRecord::Migration[5.1]
  def change
    create_table :pictures do |t|
      t.references :pictureable, polymorphic: true
    end
  end
end
