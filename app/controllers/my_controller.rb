class MyController < ApplicationController

  before_action :authenticate_user!

  def view
  end
end
