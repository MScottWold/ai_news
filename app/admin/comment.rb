ActiveAdmin.register Comment, as: "ArticleComment" do
  includes :user, :article

  before_action :skip_sidebar!

  actions :show, :index, :destroy

  index do
    column :id
    column :user
    column :article
    column :created_at
    column :updated_at

    actions
  end

  show do
    attributes_table do
      row :id
      row :user
      row :article
      row :body
      row :created_at
      row :updated_at
    end
  end
end
