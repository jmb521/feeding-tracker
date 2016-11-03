class ChildrenFeeding < ActiveRecord::Base
  belongs_to :parents
  belongs_to :children
  belongs_to :feeding

end
