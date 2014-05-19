class Chef < ActiveRecord::Base
  has_many :cookbooks
  has_many :recipes, through: :cookbooks
  has_secure_password #expects pwrd digest column, pword, and pword auth - will encrypt and put in secure pwrd column

end
