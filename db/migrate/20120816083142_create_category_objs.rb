class CreateCategoryObjs < ActiveRecord::Migration
  def change
    create_table :category_objs do |t|
      t.string :name

      t.timestamps
    end
  end
end
