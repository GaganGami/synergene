ActiveAdmin.register Service do

permit_params :title, :description, :menu_title
	
	index do
    selectable_column
    id_column
    column :menu_title
    column :title
    actions
  end

  filter :title
  filter :description

  form multipart: true do |f|
    f.inputs "Service Details" do
      f.input :menu_title
      f.input :title
      f.input :description, :as => :ckeditor
    end
    f.actions
  end

  show do
    attributes_table do
      row :id
      row :menu_title
      row :title
      row :description do |desc|
        desc.description.html_safe
      end
    end
  end



end
