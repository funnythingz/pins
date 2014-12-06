class Favorite < ActiveRecord::Base
  belongs_to :user
  has_one :pin
end
