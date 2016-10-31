class Children < ActiveRecord::Base
  belongs_to :parent
  has_many :feedings

end
