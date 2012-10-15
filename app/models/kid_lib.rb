class KidLib < ActiveRecord::Base
  attr_accessible :title, :description, :ecode, :lib_cate_id
  belongs_to :lib_cate
end
