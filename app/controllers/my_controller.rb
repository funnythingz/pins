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

  def edit_profile
    @og_site = "Edit profile"
  end
end
