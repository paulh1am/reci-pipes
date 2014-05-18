class Cookbook < ActiveRecord::Base
  belongs_to :chef
  has_many :recipes
end
