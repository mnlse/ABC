class CreateAdvertisements < ActiveRecord::Migration[5.1]
  def change
    create_table :advertisements do |t|
      t.references  :user, foreign_key: true
      t.references  :category
      t.string      :title
      t.text        :description
      t.integer     :price
      t.timestamps
    end
  end
end
