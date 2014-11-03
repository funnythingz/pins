class PinController < ApplicationController

  def permit_pingo_params
    params.require(:pin).permit(:image)
  end

  def stream
    @stream = Pin.all
  end

  def show
    @pin = set_pin.presence

    if @pin.nil?
      return redirect_to root_path
    else
      render :show
    end
  end

  def new
    if current_user
      @user_id = current_user.id
      render :new
    else
      redirect_to login_path
    end
  end

  def create
    @pin = Pin.new(pin_params)

    respond_to do |format|
      if @pin.save
        format.html { redirect_to @pin, notice: 'ok' }
      else
        format.html { render :new }
      end
    end
  end

  private
  def set_pin
    @pin = Pin.find_by(id: params[:id])
  end

  def pin_params
    params.require(:pin).permit(:title, :description, :image, :user_id)
  end

end
