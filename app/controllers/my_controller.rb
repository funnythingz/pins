class MyController < ApplicationController

  before_action :authenticate_user!

  def my
    @pins = current_user.pin.order(created_at: :desc)
    @site = "#{current_user.nickname}'s page"
  end

  def favorites
    @site = "#{current_user.nickname}'s favorites"
    @favorites = current_user.favorite.order(created_at: :desc)
  end
end
