ActiveAdmin.register Testimonial do
	permit_params :sender, :message, :avatar
	
	index do
    selectable_column
    id_column
    column :sender
    column :message
    actions
  end

  filter :sender
  filter :message

  form multipart: true do |f|
    f.inputs "Testimonial Info" do
      f.input :sender
      f.input :message
      f.input :avatar, as: :file
    end
    f.actions
  end

  show do
    attributes_table do
      row :id
      row :sender
      row :message
      row :avatar do |u|
        image_tag u.avatar.url , :size => "167x167" if u.avatar.present?
      end
      row :created_at
      row :updated_at
    end
  end


end
