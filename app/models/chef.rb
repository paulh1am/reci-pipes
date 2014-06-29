class Chef < ActiveRecord::Base
  has_many :cookbooks
  has_many :recipes, through: :cookbooks
  has_secure_password #expects pwrd digest column, pword, and pword auth - will encrypt and put in secure pwrd column
  validates :name, presence: true
  validates :phone_number, presence: true
  validates :phone_number, :length => {:is => 10, :wrong_length => "error in phone number. enter 10 digit number with no dividers ex:'-' "}
  validates_numericality_of :phone_number
end
