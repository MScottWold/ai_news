class AddActiveToArticles < ActiveRecord::Migration[7.1]
  def change
    add_column :articles, :active, :boolean, default: false
  end
end
