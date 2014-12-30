class PinController < ApplicationController
  before_action :set_pin, only: [:view, :favorites]
  before_action :set_url, only: [:view]
  before_action :set_favorite, only: [:put_favorite]

  def stream
    @stream = Pin.where(status: 'public').order(created_at: 'DESC').page(params[:page]).per(50)
    @og_site = 'Stream'
  end

  def view
    @user = User.find(@pin.user_id)
    @is_star = is_star?

    if current_user and @pin.present?
      render :view
    else
      if @pin.present? and @pin.is_public?
        render :view
      else
        return redirect_to root_path
      end
    end
  end

  def edit
    @pin = current_user.pin.find(params[:id]).presence || nil
    @og_site = "Edit: #{@pin.title}"

    if @pin.nil?
      return redirect_to root_path
    else
      render :edit
    end
  end

  def new
    @og_site = 'New'

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

  def favorites
    if @pin.is_public?
      @og_url = pin_favorites_url(@pin.id)
      @og_site = "#{@pin.title}'s favorites"
    else
      return redirect_to root_path if current_user.nil?

      unless current_user.pin.find_by(id: @pin.id).present?
        return redirect_to root_path
      end
    end
  end

  def put_favorite
    if user_signed_in?
      if @favorite.present?
        @favorite.destroy
      else
        Favorite.create(user_id: current_user.id, pin_id: params[:pin_id])
      end
      @pin = Pin.find_by(id: params[:pin_id])
    end
  end

  private

  def set_favorite
    @favorite = current_user.favorite.find_by(pin_id: params[:pin_id]) if user_signed_in?
  end

  def permit_params_pin
    params.require(:pin).permit(:title, :description, :image, :user_id, :status)
  end

  def set_pin
    @pin = Pin.find_by(id: params[:id]).presence || nil
    @og_site = @pin.title
    @og_url = pin_url(@pin.id)
    @og_type = 'article'
    @og_image = @pin.image.icon.url
  end

  def is_star?
    if current_user.nil?
      false
    else
      current_user.favorite.find_by(pin_id: params[:id]).present?
    end
  end

  def set_url
    @url = request.original_url
  end
end
