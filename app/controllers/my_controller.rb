class MyController < ApplicationController

  before_action :authenticate_user!

  def view
    @my = current_user
    @pins = Pin.where(user_id: @my.id).order(created_at: 'DESC')
  end
end
