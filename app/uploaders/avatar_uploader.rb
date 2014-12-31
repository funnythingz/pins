# encoding: utf-8

class AvatarUploader < ImageUploader

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
end
