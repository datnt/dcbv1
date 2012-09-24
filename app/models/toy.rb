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

  def self.by_age_without_image(cate_id)
    arr_ids = []
    arr_ids = Toy.find_by_sql('select toy_id from age_cates_toys where age_cate_id='+cate_id).map(&:toy_id)
    objs = Toy.find_by_sql("select id,name, category_obj_id  from toys where id in ("+arr_ids.join(',')+")")
  end

  def self.detail_without_image(id)
    Toy.find_by_sql('select id,name,description,price, category_obj_id from toys where id='+id).first
  end

end
