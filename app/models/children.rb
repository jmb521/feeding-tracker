class Children < ActiveRecord::Base
  belongs_to :parent
  has_many :parents, through: :parents_children


end
