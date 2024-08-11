class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.text :body, null: false
      t.integer :user_id, null: false, index: true
      t.integer :article_id, null: false, index: true
      
      t.timestamps
    end
  end
end
