class PingoController < ApplicationController
  def permit_pingo_params
    params.require(:pingo).permit(:image)
  end
end
