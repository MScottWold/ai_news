class RemoveRequiredFieldsFromPhoto < ActiveRecord::Migration[7.1]
  def change
    change_column_null :photos, :alt_text, true
  end
end
