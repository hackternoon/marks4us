class Mrk < ActiveRecord::Base
  # Associations before white-list:
  belongs_to :usr
  belongs_to :user
  attr_accessible :note, :tag1, :tag2, :tag3, :uurl
  # Callbacks after Associations
  before_save :check_owner

  # I ensure that each @mrk belongs to at least usr 1 which should be Guest.
  def check_owner
    if(self.usr_id.blank? and self.user_id.blank?)
      # usr 1 should be Guest which I create via db/seeds.rb
      self.usr_id = 1
    end
  end # def check_owner
end
