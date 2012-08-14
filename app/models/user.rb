class User < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :name, :email, :avatar

  has_attached_file :avatar,
                    :storage => :database,
                    :styles => { :thumb => "75x75>", :small => "150x150>" },
                    :url => '/:class/:id/:attachment?style=:style'

scope :without_file_data, select_without_file_columns_for(:avatar)

end
