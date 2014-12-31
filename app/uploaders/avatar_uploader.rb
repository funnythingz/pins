# encoding: utf-8

class AvatarUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

  process :resize_to_fill => [96, 96]

  version :thumb do
    process :resize_to_fill => [48, 48]
  end

  version :icon do
    process :resize_to_fill => [24, 24]
  end

  def extension_white_list
    %w(jpg jpeg png)
  end

  process convert: 'jpg'
  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def filename
    "#{secure_token}.#{file.extension}" if original_filename.present?
  end

  def geometry
    @geometry ||= get_geometry
  end

  def get_geometry
    if @file.present?
      image = MiniMagick::Image.open(@file.file)
      { width: image[:width], height: image[:height] }
    end
  end

  def fix_exif_rotation
    manipulate! do |img|
      img.tap(&:auto_orient)
    end
  end

  process :fix_exif_rotation

  protected
  def secure_token
    token = :"@#{mounted_as}_secure_token"
    model.instance_variable_get(token) or model.instance_variable_set(token, SecureRandom.uuid)
  end

end
