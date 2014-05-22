class Recipe < ActiveRecord::Base
  belongs_to :cookbook
  validates :name, presence: true
end
