class Children < ActiveRecord::Base
  belongs_to :parent
  attr_accessor :name, :last_feeding
  CHILDREN = []

  # def initialize(args)
  #   @name = args[:name]
  #   @last_feeding = args[:last_feeding]
  #   CHILDREN << self
  # end

end
