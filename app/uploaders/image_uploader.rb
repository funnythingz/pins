# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

  process :resize_to_limit => [1024, 768]

  version :thumb do
    process :resize_to_fill => [265, 265]
  end

  version :icon do
    process :resize_to_fill => [100, 100]
  end

  def extension_white_list
    %w(jpg jpeg)
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
