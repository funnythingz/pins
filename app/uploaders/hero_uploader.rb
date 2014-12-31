# encoding: utf-8

class HeroUploader < ImageUploader

  process :resize_to_fill => [1170, 315]

  version :thumb do
  end

  version :icon do
  end
end
