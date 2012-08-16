ActiveAdmin.register Toy do

  index do
    column :id
    column :name
    column :description
    column :avatar_file_name
    column :avatar_content_type
    column :avatar_file_size

    default_actions
  end


  show do |toy|
    attributes_table do
      row :name
      row :description
      row :avatar_file_name
      row :avatar_content_type
      row :avatar_file_size
      row :avatar do
        image_tag(toy.avatar.url(:small))
      end
    end
  end

  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs "Details" do
      f.input :name
      f.input :description
      f.input :avatar
      f.input :price
    end
    f.buttons
  end
  
end
