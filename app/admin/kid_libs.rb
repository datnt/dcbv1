ActiveAdmin.register KidLib do
  index do
    column :id
    column :title
    column "Description" do |itm|
      truncate(itm.description, :length => 30).html_safe
    end

    default_actions
  end
  

  show do |toy|
    attributes_table do
      row :title
      row "Description" do |itm|
        itm.description.html_safe
      end
      row "Embeded" do |itm|
        itm.ecode.html_safe
      end 
    end
  end



end
