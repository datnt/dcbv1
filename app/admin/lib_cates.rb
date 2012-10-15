ActiveAdmin.register LibCate do
  menu :label => "Danh muc TVBV"
  index do
    column :id
    column :name

    default_actions
  end
  
end
