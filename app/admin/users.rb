ActiveAdmin.register User do

  index do
    column :id
    column :name
    column :email
    column :avatar_file_name
    column :avatar_content_type
    column :avatar_file_size

    default_actions
  end

  show do |user|
    attributes_table do
      row :name
      row :email
      row :avatar_file_name
      row :avatar_content_type
      row :avatar_file_size
      row :avatar do
        image_tag(user.avatar.url(:small))
      end
      end
  end


  

  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs "Details" do
      f.input :name
      f.input :email
      f.input :avatar
    end
    f.buttons
  end
  
end
