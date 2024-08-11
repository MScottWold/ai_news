class CreatePhotos < ActiveRecord::Migration[6.1]
  def change
    create_table :photos do |t|
      t.string :alt_text, null: false
      t.string :title, null: false
      t.string :source_url, null: false
      t.string :photographer_name, null: false
      t.string :photographer_url, null: false
      t.string :license_type, null: false
      t.string :license_url, null: false

      t.timestamps
    end
  end
end
