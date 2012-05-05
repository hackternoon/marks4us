class UsrSessionsController < Devise::SessionsController
  def new
    super
  end

  def create
    # See if person wants to authenticate a Usr-object:
    @usr = Usr.find_by_name(params[:user][:email]).try(:authenticate, params[:user][:password])
    if @usr.present?
      session[:usr] = @usr.name
      return
    else
      # See if person wants to authenticate a User-object.
      # I'll ask Devise to do the work:
      super
      if current_user.present?
        # The layout wants to know who is logged in.
        # I supply either a name or an e-mail via session.
        session[:usr] = current_user.email
      else
        session[:usr] = 'Guest'
      end
    end
  end

  def destroy
    # If the person has a session[:usr], I set it to 'Guest'
    session[:usr] = 'Guest'
    # If the person has a current_user object, I'll let Devise destroy the session:
    super if current_user.present?
  end
end
