ActiveAdmin.register User do

	permit_params :first_name, :last_name, :avatar, :designation, :short_description, :description, :email

	index do
    selectable_column
    id_column
    column :email
    column :first_name
    column :last_name
    column :designation
    actions
  end

  filter :email
  filter :first_name
  filter :last_name
  filter :designation

  form multipart: true do |f|
    f.inputs "User Details" do
      f.input :email
      f.input :first_name
      f.input :last_name
      f.input :designation
      f.input :short_description, :as => :ckeditor
      f.input :description, :as => :ckeditor
      f.input :avatar, :as => :file #, :hint => f.object.avatar_file_name.present? ? f.template.image_tag(f.object.attachment.url(:small)) : f.template.content_tag(:span, "No Image Yet")
    end
    f.actions
  end

  show do
    attributes_table do
      row :id
      row :email
      row :first_name
      row :last_name
      row :avatar do |u|
        image_tag u.avatar.url , :size => "100x100" if u.avatar.present?
      end
      row :designation
      row :short_description
      row :description
      row :created_at
      row :updated_at
    end
  end
end
