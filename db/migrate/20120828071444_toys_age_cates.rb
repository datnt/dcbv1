class ToysAgeCates < ActiveRecord::Migration
  def self.up
    create_table :age_cates_toys do |t|
      t.integer :age_cate_id
      t.integer :toy_id
    end
  end

  def self.down
    drop_table :age_cates_toys
  end
end
