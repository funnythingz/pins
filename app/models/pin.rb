require 'file_size_validator'

class Pin < ActiveRecord::Base

  IMAGE_MIN_WIDTH  = 400
  IMAGE_MIN_HEIGHT = 400

  mount_uploader :image, ImageUploader

  belongs_to :user
  belongs_to :favorite
  has_many :favorite, foreign_key: :pin_id

  validates :title, length: { maximum: 50 }, presence: true
  validates :description, length: { maximum: 1000}, presence: true

  validate :check_image_dimensions

  def check_image_dimensions
    if image.geometry.present?
      Rails.logger.info "Image upload dimensions: #{image.geometry[:width]}x#{image.geometry[:height]}"
      errors.add :image, "#{IMAGE_MIN_WIDTH}x#{IMAGE_MIN_HEIGHT}ピクセル以上のサイズの画像をアップロードしてください" if image.geometry[:width] < IMAGE_MIN_WIDTH || image.geometry[:height] < IMAGE_MIN_HEIGHT
    end
  end

  def is_public?
    status.eql? 'public'
  end

  def is_private?
    status.eql? 'private'
  end
end
