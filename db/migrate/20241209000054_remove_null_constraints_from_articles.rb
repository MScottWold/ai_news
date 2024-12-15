class RemoveNullConstraintsFromArticles < ActiveRecord::Migration[7.1]
  def change
    change_column_null :articles, :body, true
  end
end
