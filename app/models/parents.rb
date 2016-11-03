class Parents < ActiveRecord::Base
  has_many :children
  has_many :parents_children
  has_many :children, through: :parents_children
  has_secure_password

end
