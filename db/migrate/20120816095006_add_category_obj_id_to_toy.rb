class AddCategoryObjIdToToy < ActiveRecord::Migration
  def change
    add_column :toys, :category_obj_id, :integer
  end
end
