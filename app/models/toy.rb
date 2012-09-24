class Toy < ActiveRecord::Base
  attr_accessible :name, :price, :description, :avatar, :category_obj_id, :age_cate_ids

  belongs_to :category_obj
  has_and_belongs_to_many :age_cates

  has_attached_file :avatar,
                    :storage => :database,
#                    :styles => { :thumb => "75x75>", :small => "150x150>" },
                    :styles => { :thumb => "75x75>", :small => "555x417>" },
                    :url => '/:class/:id/:attachment?style=:style'

  scope :without_file_data, select_without_file_columns_for(:avatar)

  def self.all_without_img
    Toy.find_by_sql('select id,name, category_obj_id from toys')
  end

end
