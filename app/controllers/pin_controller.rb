class PinController < ApplicationController

  def permit_pingo_params
    params.require(:pin).permit(:image)
  end

  def stream
    @stream = Pin.all
  end

  def view
    @pin = Pin.get_pin(params[:id]).presence || nil
    @user = User.find(@pin.user_id)

    if @pin.nil?
      return redirect_to root_path
    else
      render :view
    end
  end

  def edit
    @pin = current_user.pin.find(params[:id]).presence || nil

    if @pin.nil?
      return redirect_to root_path
    else
      render :edit
    end
  end

  def new
    if current_user
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

  def destroy
    if current_user.pin.find(params[:id]).destroy
      flash_message = {success: 'deleted pin'}
    else
      flash_message = {error: 'error'}
    end

    redirect_to my_path, flash: flash_message
  end

end
