class RemoveFieldsFromPhotos < ActiveRecord::Migration[7.1]
  def change
    remove_columns(
      :photos,
      :title,
      :source_url,
      :photographer_name,
      :photographer_url,
      :license_type,
      :license_url,
      type: :string,
    )
  end
end
