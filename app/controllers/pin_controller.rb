class PinController < ApplicationController
  before_action :set_pin, only: [:view]
  before_action :set_url, only: [:view]

  def stream
    @stream = Pin.where(status: 'public').order(created_at: 'DESC').page(params[:page]).per(50)
    @site = 'Stream'
  end

  def view
    @user = User.find(@pin.user_id)
    @site = @pin.title

    if current_user and @pin.present?
      render :view
    else
      if @pin.present? and is_public? @pin
        render :view
      else
        return redirect_to root_path
      end
    end
  end

  def edit
    @pin = current_user.pin.find(params[:id]).presence || nil
    @site = "Edit: #{@pin.title}"

    if @pin.nil?
      return redirect_to root_path
    else
      render :edit
    end
  end

  def new
    @site = 'New'

    if current_user
      @errors   = flash[:errors]
      render :new
    else
      redirect_to login_path
    end
  end

  def create
    @pin = Pin.new(permit_params_pin)
    @pin.user_id = current_user.id

    respond_to do |format|
      if @pin.save
        format.html { redirect_to @pin, flash: { success: 'posted YEAH!' } }
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
    params.require(:pin).permit(:title, :description, :image, :user_id, :status)
  end

  def set_pin
    @pin = PinDecorator.find(params[:id]).decorate.presence || nil
  end

  def is_public?(pin)
    pin.status.eql? 'public'
  end

  def set_url
    @url = request.original_url
  end
end
