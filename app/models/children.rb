class Children < ActiveRecord::Base
  belongs_to :parent
  has_many :parent_children
  has_many :parents, through: :parents_children

  has_many :children_feedings
  has_many :feedings, through: :children_feedings



end
