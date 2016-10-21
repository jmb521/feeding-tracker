class Parents < ActiveRecord::Base
  has_many :children
  belongs_to :family
  has_many :children, through: :parents_children
  has_secure_password

end
