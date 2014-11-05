class Pin < ActiveRecord::Base

  mount_uploader :image, ImageUploader

  validates :title, length: { maximum: 50 }, presence: true
  validates :description, length: { maximum: 1000}, presence: true
  validates :image, presence: true

  scope :get_pin, ->(id) {
    Pin.find_by(id: id)
  }

  scope :get_pin_params, -> (params) {
    params.require(:pin).permit(:title, :description, :image, :user_id)
  }
end
