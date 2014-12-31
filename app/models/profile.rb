class Profile < ActiveRecord::Base

  AVATAR_MIN_WIDTH  = 96
  AVATAR_MIN_HEIGHT = 96

  HERO_MIN_WIDTH  = 240
  HERO_MIN_HEIGHT = 120

  belongs_to :user

  mount_uploader :avatar, AvatarUploader
  mount_uploader :hero, HeroUploader

  validates :user_id, uniqueness: true
  validates :profile, length: { maximum: 120}, presence: false
  validate :check_avatar_dimensions
  validate :check_hero_dimensions

  def check_avatar_dimensions
    if avatar.geometry.present?
      Rails.logger.info "avatar upload dimensions: #{avatar.geometry[:width]}x#{avatar.geometry[:height]}"
      errors.add :avatar, "#{AVATAR_MIN_WIDTH}x#{AVATAR_MIN_HEIGHT}ピクセル以上のサイズの画像をアップロードしてください" if avatar.geometry[:width] < AVATAR_MIN_WIDTH || avatar.geometry[:height] < AVATAR_MIN_HEIGHT
    end
  end

  def check_hero_dimensions
    if hero.geometry.present?
      Rails.logger.info "hero upload dimensions: #{hero.geometry[:width]}x#{hero.geometry[:height]}"
      errors.add :hero, "#{HERO_MIN_WIDTH}x#{HERO_MIN_HEIGHT}ピクセル以上のサイズの画像をアップロードしてください" if hero.geometry[:width] < HERO_MIN_WIDTH || hero.geometry[:height] < HERO_MIN_HEIGHT
    end
  end
end
