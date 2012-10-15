class CreateLibCates < ActiveRecord::Migration
  def change
    create_table :lib_cates do |t|
      t.string :name

      t.timestamps
    end
  end
end
