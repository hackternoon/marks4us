class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable
  # Associations before white-list:
  has_many :mrks, :dependent => :destroy
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # Callbacks after Associations
  before_save :filter_big_strings

  private

  # I want to filter out big strings
  def filter_big_strings
    self.email = self.email.truncate(50) if self.email.present?
    self.password = self.password.truncate(50) if self.password.present?
    self.password_confirmation = self.password_confirmation.truncate(50) if self.password_confirmation.present?
  end # def filter_big_strings
  
end
