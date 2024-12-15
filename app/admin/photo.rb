ActiveAdmin.register Photo do
  before_action :skip_sidebar!

  actions :all, except: :destroy

  index do
    column :id
    column :article
    column :created_at
    column :updated_at

    actions
  end

  show do |resource|
    attributes_table do
      row :id
      row :alt_text
      row :article
      row :created_at
      row :updated_at
      row :image do
        if resource.image.attached?
          image_tag resource.image.variant(:thumb)
        end
      end
    end
  end

  form do |f|
    f.inputs do
      f.input :alt_text
      f.input :article
      f.input :image, as: :file
    end

    f.actions
  end

  action_item :purge, only: :show do
    if resource.image_attached?
      button_to(
        I18n.t("models.photo.delete_images"),
        purge_photo_admin_photo_path(resource),
        method: :put,
      )
    end
  end

  action_item :generate_photo, only: :show do
    if resource.alt_text.present? && !resource.image.attached?
      button_to(
        I18n.t("models.photo.generate_photo"),
        generate_photo_admin_photo_path(resource),
        method: :put,
      )
    end
  end

  member_action :purge_photo, method: :put do
    resource.image.purge

    redirect_to resource_path, notice: I18n.t("models.photo.photos_deleted")
  end

  member_action :generate_photo, method: :put do
    AiPhotoGenerator.generate_photo(resource)

    redirect_to resource_path, notice: I18n.t("models.photo.photo_generated")
  end

  permit_params(
    :alt_text,
    :article_id,
    :image,
  )
end
