ActiveAdmin.register User do
  before_action :skip_sidebar!

  actions :all, except: :destroy

  index do
    column :id
    column :username
    column :admin
    column :email
    column :created_at
    column :updated_at

    actions
  end

  show do
    attributes_table do
      row :id
      row :username
      row :email
      row :session_token
      row :admin
      row :created_at
      row :updated_at
    end
  end

  form do |f|
    f.inputs do
      f.input :username
      f.input :session_token
      f.input :admin
    end

    f.actions
  end

  permit_params(
    :username,
    :session_token,
    :admin,
  )
end
