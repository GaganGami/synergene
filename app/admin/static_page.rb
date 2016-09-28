ActiveAdmin.register StaticPage do

permit_params :key, :title, :content
	
	index do
    selectable_column
    id_column
    column :key
    column :title
    column :content
    actions
  end

  filter :title
  filter :content

  form multipart: true do |f|
    f.inputs "Static Page Details" do
      f.input :title
      f.input :key
      f.input :content, :as => :ckeditor
    end
    f.actions
  end

  show do
    attributes_table do
      row :id
      row :title
      row :key
      row :content do |s|
        s.content.html_safe
      end
      row :created_at
      row :updated_at
    end
  end


end
