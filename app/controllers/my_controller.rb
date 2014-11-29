class MyController < ApplicationController

  before_action :authenticate_user!

  def my
    @my = current_user
    @pins = current_user.pin.order(created_at: 'DESC')
  end
end
