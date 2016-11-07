class Children < ActiveRecord::Base
  has_many :parents_children
  has_many :parents, through: :parents_children

  has_many :children_feedings
  has_many :feedings, through: :children_feedings



end
