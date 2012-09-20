ActiveAdmin.register Toy do

  index do
    column :id
    column :name
    column "Description" do |itm|
      itm.description.html_safe
    end
    column :avatar_file_name
    column :avatar_content_type
    column :avatar_file_size
    column :category_obj

    column "Lua tuoi" do |itm|
         (itm.age_cates.map{ |p| p.name} )
    end

    default_actions
  end


  show do |toy|
    attributes_table do
      row :name
      row "Description" do |itm|
        itm.description.html_safe
      end
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
      f.input :description, as: :html_editor
      f.input :avatar
      f.input :price
      f.input :category_obj
      f.input :age_cates
    end
    f.buttons
  end
  
end
