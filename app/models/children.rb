class Children < ActiveRecord::Base
  :belongs_to :family, through: :parent

end
