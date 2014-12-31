class Profile < ActiveRecord::Base

  AVATAR_MIN_WIDTH  = 96
  AVATAR_MIN_HEIGHT = 96

  belongs_to :user

  mount_uploader :avatar, AvatarUploader

  validates :user_id, uniqueness: true
  validates :profile, length: { maximum: 120}, presence: false
  validate :check_avatar_dimensions

  def check_avatar_dimensions
    if avatar.geometry.present?
      Rails.logger.info "avatar upload dimensions: #{avatar.geometry[:width]}x#{avatar.geometry[:height]}"
      errors.add :avatar, "#{AVATAR_MIN_WIDTH}x#{AVATAR_MIN_HEIGHT}ピクセル以上のサイズの画像をアップロードしてください" if avatar.geometry[:width] < AVATAR_MIN_WIDTH || avatar.geometry[:height] < AVATAR_MIN_HEIGHT
    end
  end
end
