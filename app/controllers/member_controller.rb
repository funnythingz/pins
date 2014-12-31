class MemberController < ApplicationController
  before_action :set_member, only: [:member, :favorites]

  def member
    @pins = @member.pin.order(created_at: 'DESC')
  end

  def favorites
    @og_site = "#{@member.nickname}'s favorites"
    @favorites = @member.favorite.order(created_at: :desc)
  end

  private

  def set_member
    @member = User.find(params[:id])
    @og_site = @member.nickname
    @og_url = member_url(@member.id)
    @og_type = 'article'
    @og_image = @member.profile.avatar.icon.url if @member.profile.avatar.present?
  end
end
