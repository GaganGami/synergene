ActiveAdmin.register Service do

permit_params :title, :description
	
	index do
    selectable_column
    id_column
    column :title
    column :description
    actions
  end

  filter :title
  filter :description

  form multipart: true do |f|
    f.inputs "Service Details" do
      f.input :title
      f.input :description, :as => :ckeditor
    end
    f.actions
  end

  show do
    attributes_table do
      row :id
      row :title
      row :description
    end
  end



end
