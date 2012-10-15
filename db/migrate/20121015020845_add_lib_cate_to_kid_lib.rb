class AddLibCateToKidLib < ActiveRecord::Migration
  def change
    add_column :kid_libs, :lib_cate_id, :integer
  end
end
