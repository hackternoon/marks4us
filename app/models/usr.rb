class Usr < ActiveRecord::Base
  # Associations before white-list:
  has_many :mrks, :dependent => :destroy
  attr_accessible :name, :password, :password_confirmation
  validates :name, presence: true, uniqueness: true
  has_secure_password

  # Callbacks after Associations
  before_save :filter_big_strings

  private

  # I want to filter out big strings
  def filter_big_strings
    self.name = self.name.truncate(20) if self.name.present?
    self.password = self.password.truncate(40) if self.password.present?
    self.password_confirmation = self.password_confirmation.truncate(40) if self.password_confirmation.present?
  end # def filter_big_strings
end
