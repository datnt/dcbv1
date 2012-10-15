class KidLib < ActiveRecord::Base
  attr_accessible :title, :description, :ecode
  belongs_to :lib_cate
end
