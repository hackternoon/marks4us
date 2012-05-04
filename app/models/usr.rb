class Usr < ActiveRecord::Base
  attr_accessible :name
  has_secure_password
end
