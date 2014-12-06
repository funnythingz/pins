class MyController < ApplicationController

  before_action :authenticate_user!

  def my
    @pins = current_user.pin.order(created_at: 'DESC')
  end

  def favorites
    @favorites = current_user.favorite.order(created_at: :desc)
  end
end
