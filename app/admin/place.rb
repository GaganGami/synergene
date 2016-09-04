ActiveAdmin.register Place do

permit_params :title, :description, :url, :photo
	
	index do
    selectable_column
    id_column
    column :title
    column :url
    column :description
    actions
  end

  filter :title
  filter :description

  form multipart: true do |f|
    f.inputs "Place Details" do
      f.input :title
      f.input :url
      f.input :photo, as: :file
      f.input :description, :as => :ckeditor
    end
    f.actions
  end

  show do
    attributes_table do
      row :id
      row :title
      row :url
      row :photo do |u|
        image_tag u.photo.url if u.photo.present?
      end
      row :created_at
    end
  end

end
