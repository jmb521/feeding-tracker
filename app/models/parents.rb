class Parents < ActiveRecord::Base
  has_many :children
  belongs_to :family

end
