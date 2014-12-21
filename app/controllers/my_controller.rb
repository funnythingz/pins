class MyController < ApplicationController

  before_action :authenticate_user!
  before_action :set_favorite, only: [:toggle_favorite]

  def my
    @og_site = "#{current_user.nickname}'s page"
    @pins = current_user.pin.order(created_at: :desc)
  end

  def favorites
    @og_site = "#{current_user.nickname}'s favorites"
    @favorites = current_user.favorite.order(created_at: :desc)
  end

  def toggle_favorite
    if @favorite.present?
      @favorite.destroy
    else
      Favorite.create(user_id: current_user.id, pin_id: params[:pin_id])
    end
    redirect_to :back
  end

  private

  def set_favorite
    @favorite = current_user.favorite.find_by(pin_id: params[:pin_id])
  end
end
