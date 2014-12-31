class MyController < ApplicationController

  before_action :authenticate_user!

  def my
    @og_site = "#{current_user.nickname}'s page"
    @pins = current_user.pin.order(created_at: :desc)
  end

  def favorites
    @og_site = "#{current_user.nickname}'s favorites"
    @favorites = current_user.favorite.order(created_at: :desc)
  end

  def edit_user
    @og_site = "Edit user"
  end

  def update_user
    if current_user.update_with_password(set_user)
      sign_in current_user, bypass: true
      flash_message = { success: 'Updated' }
    else
      flash_message = { errors: current_user.errors.messages }
    end

    redirect_to :back, flash: flash_message
  end

  def edit_profile
    @og_site = "Edit profile"
  end

  def update_profile
    respond_to do |format|
      if current_user.profile.update(set_profile)
        format.html { redirect_to :back, flash: { success: 'updated YEAH!' } }
      else
        format.html { redirect_to :back, flash: { errors: current_user.profile.errors.messages } }
      end
    end
  end

  private

  def set_user
    params.required(:user).permit(:email, :username, :current_password, :password, :password_confirmation)
  end

  def set_profile
    params.require(:profile).permit(:profile, :avatar, :hero)
  end
end
