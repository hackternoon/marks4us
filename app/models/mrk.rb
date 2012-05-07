class Mrk < ActiveRecord::Base
  # Associations before white-list:
  belongs_to :usr
  belongs_to :user
  attr_accessible :note, :tag1, :tag2, :tag3, :uurl
  # Callbacks after Associations
  before_save :check_owner,:check_url_scheme

  # A mrk can be owned by a user or a usr.
  # I look for both and return one.
  def owner_h
    case
    when self.user_id.present?
      {:owner_id => self.user_id, :owner_type => :user, :name_or_email => self.user.email }
    when self.usr_id.present?
      {:owner_id => self.usr_id, :owner_type => :usr, :name_or_email => self.usr.name }
    else
      {:owner_id => self.usr_id, :owner_type => :usr, :name_or_email => 'Guest' }
    end
  end

  private

  # I ensure that each @mrk belongs to at least usr 1 which should be Guest.
  def check_owner
    if(self.usr_id.blank? and self.user_id.blank?)
      # usr 1 should be Guest which I create via db/seeds.rb
      self.usr_id = 1
    end
  end # def check_owner

  # I use URL to check the "scheme" of the uurl.
  # Scheme is usually http, https, ftp.
  def check_url_scheme
    myurl = URI.parse self.uurl
    if (self.uurl.match(/(^http:)|(^https:)|(^ftp:)/) and myurl.scheme.present? and myurl.host.present?)
      # I'm happy.
    else
      self.uurl = "http://#{self.uurl}"
    end
  end # def check_url_scheme
end
