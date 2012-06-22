class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  skip_before_filter :authenticate_user!

  def facebook
    
    @email = env["omniauth.auth"]['extra']['raw_info']['email']
    @user = User.find_for_facebook_oauth(@email, current_user)

    if @user.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Facebook"
      sign_in_and_redirect @user, :event => :authentication
    else
      session["devise.facebook_data"] = env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end
  
  def passthru
    logger.debug "Inside Passthrought"
    render :file => "#{Rails.root}/public/404.html", :status => 404, :layout => false
    logger.debug "After render"
  end
  
end