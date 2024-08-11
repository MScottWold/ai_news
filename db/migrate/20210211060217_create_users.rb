class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :username, null: false, index: { unique: true }
      t.string :password_digest, null: false
      t.string :session_token, null: false, index: { unique: true }
      t.boolean :admin, null: false, default: false

      t.timestamps
    end
  end
end
