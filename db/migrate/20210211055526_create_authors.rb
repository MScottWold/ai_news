class CreateAuthors < ActiveRecord::Migration[6.1]
  def change
    create_table :authors do |t|
      t.string :name, null: false
      t.string :bio, null: false
      t.string :education, null: false
      
      t.timestamps
    end
  end
end
