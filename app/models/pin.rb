class Pin < ActiveRecord::Base

  mount_uploader :image, ImageUploader

  validates :title, length: { maximum: 50 }, presence: true
  validates :description, length: { maximum: 1000}, presence: true
  validates :image, presence: true
  validate :check_image_dimensions

  def check_image_dimensions
    ::Rails.logger.info "Image upload dimensions: #{image.geometry[:width]}x#{image.geometry[:height]}"
    errors.add :image, '400x400ピクセル以上のサイズの画像をアップロードしてください' if image.geometry[:width] < 400 || image.geometry[:height] < 400
  end

  scope :get_pin, ->(id) {
    Pin.find_by(id: id)
  }

  scope :get_pin_params, -> (params) {
    params.require(:pin).permit(:title, :description, :image, :user_id)
  }
end
