class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    puts "********* callback facebook" 
    # You need to implement the method below in your model (e.g. app/models/user.rb)
        @user = User.from_omniauth(request.env["omniauth.auth"])

        if @user.persisted?
            flash.notice = "ログインしました！"
            sign_in_and_redirect @user
        else
            session["devise.user_attributes"] = @user.attributes
            redirect_to new_user_registration_url
        end
  end
end