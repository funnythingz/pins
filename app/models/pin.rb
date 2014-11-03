class Pin < ActiveRecord::Base
  mount_uploader :image, ImageUploader
end
