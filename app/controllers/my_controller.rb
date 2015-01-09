class MyController < ApplicationController
  before_action :authenticate_user!
  before_action :set_favorites, only: [:my, :favorites, :edit_user, :edit_profile]

  def my
    @og_site = "#{current_user.nickname}'s page"
    @pins = current_user.pin.order(created_at: :desc)
  end

  def favorites
    @og_site = "#{current_user.nickname}'s favorites"
  end

  def boards
    @og_site = "#{current_user.nickname}'s boards"
  end

  def edit_user
    @og_site = "Edit user"
  end

  def update_user
    if current_user.update_with_password(user_params)
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
      if current_user.profile.update(profile_params)
        format.html { redirect_to :back, flash: { success: 'updated YEAH!' } }
      else
        format.html { redirect_to :back, flash: { errors: current_user.profile.errors.messages } }
      end
    end
  end

  private

  def user_params
    params.required(:user).permit(:email, :username, :current_password, :password, :password_confirmation)
  end

  def profile_params
    params.require(:profile).permit(:profile, :avatar, :hero)
  end

  def set_favorites
    @favorites = current_user.favorite.joins(:pin).merge(Pin.where(status: 'public')).order(created_at: :desc)
  end
end
