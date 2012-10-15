class LibCate < ActiveRecord::Base
  validates :name, :uniqueness =>  {:message => "Name is not unique."}
  attr_accessible :name

  has_many :kid_libs
end
