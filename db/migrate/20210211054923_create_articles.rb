class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.string :title, null: false
      t.text :body, null: false
      t.string :section, null: false
      t.integer :author_id, null: false, index: true
      t.integer :photo_id, null: false, index: true

      t.timestamps
    end
  end
end
