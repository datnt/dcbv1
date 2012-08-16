class CategoryObj < ActiveRecord::Base
  validates :name, :uniqueness =>  {:message => "Name is not valid."}

  attr_accessible :name
end
