class Pin < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  validates :title, :image, presence: true
  validate :check_image_dimensions

  def check_image_dimensions
    ::Rails.logger.info "Image upload dimensions: #{image.geometry[:width]}x#{image.geometry[:height]}"
    errors.add :image, '400x400ピクセル以上のサイズの画像をアップロードしてください' if image.geometry[:width] < 400 || image.geometry[:height] < 400
  end
end
