class MyController < ApplicationController

  before_action :authenticate_user!

  def my
    @pins = current_user.pin.order(created_at: 'DESC')
  end
end
