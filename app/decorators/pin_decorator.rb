class PinDecorator < Draper::Decorator
  delegate_all

  def is_private?
    object.status.eql? 'private'
  end

  def is_public?
    object.status.eql? 'public'
  end
end
