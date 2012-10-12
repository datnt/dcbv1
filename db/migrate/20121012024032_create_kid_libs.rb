class CreateKidLibs < ActiveRecord::Migration
  def change
    create_table :kid_libs do |t|
      t.string :title
      t.text :description
      t.text :ecode

      t.timestamps
    end
  end
end
