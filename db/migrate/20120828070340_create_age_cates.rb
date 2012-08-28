class CreateAgeCates < ActiveRecord::Migration
  def change
    create_table :age_cates do |t|
      t.string :name

      t.timestamps
    end
  end
end
