class PingoController < ApplicationController
  def permit_pingo_params
    params.require(:pingo).permit(:image)
  end

  def stream

  end
end
