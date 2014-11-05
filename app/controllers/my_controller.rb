class MyController < ApplicationController

  before_action :authenticate_user!

  def view
    @my = current_user
    @pins = Pin.where(user_id: current_user.id).order(created_at: 'DESC')
  end
end
