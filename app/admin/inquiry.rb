ActiveAdmin.register Inquiry do

permit_params :name, :email, :subject, :content
	
	index do
    selectable_column
    id_column
    column :name
    column :email
    column :subject
    actions
  end

  filter :email
  filter :name
  filter :subject
  filter :content

  form multipart: true do |f|
    f.inputs "Inquiry Details" do
      f.input :name
      f.input :email
      f.input :subject
      f.input :content
    end
    f.actions
  end

  show do
    attributes_table do
      row :id
      row :name
      row :email
      row :subject
      row :content
      row :created_at
      row :updated_at
    end
  end

end
