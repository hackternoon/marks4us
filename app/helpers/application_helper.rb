module ApplicationHelper

  # If I own an object, I often want to edit it.
  def i_own?(object)
    case
    # Guests own objects but I dont want them to know that:
    when session[:usr] == 'Guest'
      false
    # Maybe current_user owns this object?
    when (current_user.present? and object.user.present? and object.user.id.present? and (current_user.id == object.user.id))
      true
    # Maybe the usr owns this object?
    when (current_user.blank? and session[:usr_id].present? and object.usr.present? and object.usr.id.present? and ( session[:usr_id] == object.usr.id))
      true
    else
      false
    end # case
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
      {:acct_type => "Permanent Account", :name_or_email => current_user.email }
    when session[:usr].present?
      {:acct_type => "2 Month Account", :name_or_email => session[:usr] }
    else
      {:acct_type => "2 Month Account", :name_or_email => 'Guest' }
    end
  end # def usr_disp

end

