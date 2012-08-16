class Toy < ActiveRecord::Base
  attr_accessible :name, :price, :description, :avatar

  has_attached_file :avatar,
                    :storage => :database,
#                    :styles => { :thumb => "75x75>", :small => "150x150>" },
                    :styles => { :thumb => "75x75>", :small => "555x417>" },
                    :url => '/:class/:id/:attachment?style=:style'

scope :without_file_data, select_without_file_columns_for(:avatar)


end
