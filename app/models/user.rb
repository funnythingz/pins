class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  enum role: {member: 'member', admin: 'admin'}

  has_many :pin

  validates :nickname, uniqueness: true
  validates :role, format: { with: /member/, on: :create }

end
