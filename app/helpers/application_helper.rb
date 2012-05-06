module ApplicationHelper

  # If I own an object, I often want to edit it.
  def i_own?(object)
    if(current_user.present? and object.user.present? and object.user.id.present? and (current_user.id == object.user.id))
      true
    else
      false
    end
  end # def i_own?(object)

  # If I dont own an object, I sometimes want to know that.
  def i_dont_own?(object)
    if(current_user.present? and object.user.present? and object.user.id.present? and (current_user.id == object.user.id))
      false
    else
      true
    end
  end # def i_dont_own?(object)

  # In production I want users talking to https://m41.herokuapp.com
  def sslhost
    if ENV['RAILS_ENV'] == 'production'
      "https://m41.herokuapp.com"
    else
      ""
    end
  end # def sslhost

  # The layout wants to know who is logged in.
  # I look in two places.
  def usr_disp
    case
    when current_user.present?
      current_user.email
    when session[:usr].present?
      session[:usr]
    else
      'Guest'
    end
  end # def usr_disp

  # I use this method to transform a string into an HTML anchor:
  def linkized(uurl)
    myurl = URI.parse uurl
    if (myurl.scheme.present?)
      return "<a href='#{uurl}' target='u'>#{uurl}</a>"
    else
      uurl
    end
  end # def linkized(uurl)

end

