ActiveAdmin.register Article do
  includes :author, :photo
  actions :show, :index, :edit

  Article::SECTIONS.each { scope _1 }
  filter :featured, as: :select, collection: [true, false]
  filter :highlighted, as: :select, collection: [true, false]

  index do
    column :id
    column :title
    column :section
    column :author
    column :photo

    actions
  end

  show do
    attributes_table do
      row :id
      row :title
      row :body
      row :section
      row :author
      row :photo
      row :created_at
      row :updated_at
      row :featured
      row :highlighted
    end
  end
end
