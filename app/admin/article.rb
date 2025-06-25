# frozen_string_literal: true

ActiveAdmin.register Article do
  includes :author, :photo

  actions :show, :index, :edit, :update, :new, :create

  scope :all
  Article::SECTIONS.each { scope _1 }
  scope :featured
  scope :highlighted

  filter :active, as: :select, collection: [true, false]
  filter :featured, as: :select, collection: [true, false]
  filter :highlighted, as: :select, collection: [true, false]

  index do
    column :id
    column :active
    column :title
    column :section
    column :author
    column :photo

    actions
  end

  show do
    attributes_table do
      row :id
      row :active
      row :featured
      row :highlighted
      row :title
      row :body
      row :photo_caption
      row :section
      row :author
      row :photo
      row :created_at
      row :updated_at
    end
  end

  form do |f|
    f.inputs do
      f.input :active
      f.input :highlighted
      f.input :featured
      f.input :title
      f.input :body
      f.input :section, collection: Article::SECTIONS
      f.input :author
    end

    f.actions
  end

  action_item :generate_body, only: :show do
    if resource.body.blank?
      button_to(
        I18n.t("models.article.generate_body"),
        generate_body_admin_article_path(resource),
        method: :put,
      )
    end
  end

  member_action :generate_body, method: :put do
    AiArticleGenerator.generate_article_body(resource)

    redirect_to resource_path, notice: I18n.t("models.article.body_generated")
  end

  permit_params(
    :title,
    :body,
    :section,
    :author_id,
    :created_at,
    :updated_at,
    :featured,
    :highlighted,
    :active,
  )
end
