class MemberController < ApplicationController
  before_action :set_member, only: [:member]

  def member
    @pins = @member.pin.order(created_at: 'DESC')
  end

  private

  def set_member
    @member = User.find(params[:id])
  end
end
