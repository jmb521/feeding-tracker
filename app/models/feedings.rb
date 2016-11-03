class Feeding < ActiveRecord::Base

  has_many :children_feedings
  has_many :childrens, through: :children_feedings
  belongs_to :children

end
