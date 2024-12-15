class RemovePhotoIdFromArticles < ActiveRecord::Migration[7.1]
  def change
    add_reference :photos, :article, null: false
    remove_column :articles, :photo_id, :integer
  end
end
