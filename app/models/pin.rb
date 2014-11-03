class Pin < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  validates :title, :image, presence: true
end
