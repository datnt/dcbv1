ActiveAdmin.register KidLib do
  index do
    column :id
    column :title
    column "Description" do |itm|
      truncate(itm.description, :length => 30).html_safe
    end
    column :lib_cate

    default_actions
  end
  

  show do |toy|
    attributes_table do
      row :title
      row "Description" do |itm|
        itm.description.html_safe
      end
      row :lib_cate
      row "Embeded" do |itm|
        itm.ecode.html_safe
      end 
    end
  end

  form :html => { :enctype => "" } do |f|
    f.inputs "Details" do
      f.input :title
      f.input :description, as: :html_editor
      f.input :ecode
      f.input :lib_cate
    end
    f.buttons
  end



end
