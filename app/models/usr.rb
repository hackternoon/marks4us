class Usr < ActiveRecord::Base
  # Associations before white-list:
  has_many :mrks
  attr_accessible :name, :password, :password_confirmation
  validates :name, presence: true, uniqueness: true
  has_secure_password
end
