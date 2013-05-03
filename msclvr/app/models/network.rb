class Network < ActiveRecord::Base
  attr_accessible :network_name, :owner_first_name, :owner_last_name, :owner_password

  # networks can have many users

  has_many :users

  # owner password and network name are required 
  # password length must be between 8 and 14 characters long and must include at least one number and letter
  # username must be unique

  #username_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :owner_password, :network_name, :presence => true
  validates :owner_password, :length => { :in => 8..14 }
  validates :network_name, :uniqueness => true
end
