class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  skip_before_filter :authenticate_user!
  def facebook
    @user = Users::User.from_omniauth(request.env["omniauth.auth"])
    @user.skip_confirmation! if @user.present?
    unless @user.save
      user = Users::User.find_by(email: @user.email)
      if user.present?
        user.uid = @user.uid
        user.provider = @user.provider
        user.skip_confirmation!
        if user.save!
          @user = user
        end
      end
    end
    unless @user.system_membership.present?
      @user.user_system_membership.is_nested = true
      @user.system_membership.set_to_system_user(true)
    end
    sign_in_and_redirect @user
  end

  def twitter
    @user = Users::User.from_omniauth_twitter(request.env["omniauth.auth"])
    sign_in(@user)
    redirect_to authenticated_root_path() # @user
  end

  def linkedin
    @user = Users::User.from_omniauth_linkedin(request.env["omniauth.auth"])
    @user.skip_confirmation! if @user.present?
    unless @user.save
      user = Users::User.find_by(email: @user.email)
      if user.present?
        user.uid = @user.uid
        user.provider = @user.provider
        user.skip_confirmation!
        if user.save!
          @user = user
        end
      end
    end
    unless @user.system_membership.present?
      @user.user_system_membership.is_nested = true
      @user.system_membership.set_to_system_user(true)
    end
    sign_in_and_redirect @user
  end

  def google_oauth2
    @user = Users::User.find_for_google_oauth2(request.env["omniauth.auth"])
    @user.skip_confirmation! if @user.present?
    unless @user.save
      user = Users::User.find_by(email: @user.email)
      if user.present?
        user.uid = @user.uid
        user.provider = @user.provider
        user.skip_confirmation!
        if user.save!
          @user = user
        end
      end
    end
    unless @user.system_membership.present?
      @user.user_system_membership.is_nested = true
      @user.system_membership.set_to_system_user(true)
    end
    sign_in_and_redirect @user
  end

  def meetup
    @user = Users::User.from_omniauth_meetup(request.env["omniauth.auth"])
    @user.skip_confirmation! if @user.present?
    unless @user.save
      user = Users::User.find_by(email: @user.email)
      if user.present?
        user.uid = @user.uid
        user.provider = @user.provider
        user.skip_confirmation!
        if user.save!
          @user = user
        end
      end
    end
    unless @user.system_membership.present?
      @user.user_system_membership.is_nested = true
      @user.system_membership.set_to_system_user(true)
    end
    sign_in_and_redirect @user
  end

  # def failure
  #   binding.pry
  # end

end
