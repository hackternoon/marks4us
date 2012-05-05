class Mrk < ActiveRecord::Base
  # Associations before white-list:
  belongs_to :usr
  belongs_to :user
  attr_accessible :note, :tag1, :tag2, :tag3, :uurl
end
