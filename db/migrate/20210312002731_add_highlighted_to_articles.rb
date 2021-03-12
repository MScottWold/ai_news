class AddHighlightedToArticles < ActiveRecord::Migration[6.1]
  def change
    add_column :articles, :highlighted, :boolean, default: false
  end
end
