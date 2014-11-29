class PinController < ApplicationController
  before_action :set_pin, only: [:view]

  def stream
    @stream = Pin.all
  end

  def view
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
      @errors   = flash[:errors]
      render :new
    else
      redirect_to login_path
    end
  end

  def create
    @pin = Pin.new(permit_params_pin)

    respond_to do |format|
      if @pin.save
        format.html { redirect_to @pin, flash: { success: 'YEAH!' } }
      else
        format.html { redirect_to new_pin_path, flash: { errors: @pin.errors.messages } }
      end
    end
  end

  def update
    pin = Pin.find(params[:id])
    pin.update(permit_params_pin)
    flash[:success] = 'updated! YEAH!'
    redirect_to edit_pin_path
  end

  def destroy
    if current_user.pin.find(params[:id]).destroy
      flash_message = {success: 'deleted pin'}
    else
      flash_message = {error: 'error'}
    end

    redirect_to my_path, flash: flash_message
  end

  private

  def permit_params_pin
    params.require(:pin).permit(:title, :description, :image, :user_id)
  end

  def set_pin
    @pin = Pin.find(params[:id]).presence || nil
  end

end
