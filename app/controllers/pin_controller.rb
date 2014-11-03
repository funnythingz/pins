class PinController < ApplicationController

  def permit_pingo_params
    params.require(:pin).permit(:image)
  end

  def stream
    @stream = Pin.all
  end

  def show
    @pin = Pin.get_pin(params[:id]).presence

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
    @pin = Pin.new(Pin.get_pin_params(params))

    respond_to do |format|
      if @pin.save
        format.html { redirect_to @pin, notice: 'ok' }
      else
        format.html { render :new }
      end
    end
  end

end
