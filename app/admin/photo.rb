ActiveAdmin.register Photo do
  before_action :skip_sidebar!

  actions :all, except: :destroy

  index do
    column :id
    column :title
    column :created_at
    column :updated_at

    actions
  end

  show do |resource|
    attributes_table do
      row :id
      row :alt_text
      row :title
      row :source_url
      row :photographer_name
      row :photographer_url
      row :license_type
      row :license_url
      row :created_at
      row :updated_at
      row :thumbnail do
        image_tag resource.thumbnail.url
      end
      row :image do
        image_tag resource.image.url
      end
    end
  end

  form do |f|
    f.inputs do
      f.input :alt_text
      f.input :title
      f.input :source_url
      f.input :photographer_name
      f.input :photographer_url
      f.input :license_type
      f.input :license_url
      f.input :thumbnail
      f.input :image
    end

    f.actions
  end

  permit_params(
    :alt_text,
    :title,
    :source_url,
    :photographer_name,
    :photographer_url,
    :license_type,
    :license_url,
    :thumbnail,
    :image,
  )
end
