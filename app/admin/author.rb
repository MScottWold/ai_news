ActiveAdmin.register Author do
  includes :articles

  before_action :skip_sidebar!

  actions :show, :index, :edit

  index do
    column :id
    column :name
    column :created_at
    column :updated_at

    actions
  end

  show do
    attributes_table do
      row :id
      row :name
      row :bio
      row :education
      row :created_at
      row :updated_at
    end
  end
end
