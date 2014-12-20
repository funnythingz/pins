class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  enum role: {member: 'member', admin: 'admin'}

  has_many :pin
  has_many :favorite, foreign_key: :user_id
  has_one :profile, foreign_key: :user_id

  with_options on: :create do
    validates :nickname, format: { with: /\A[a-z0-9]+\z/ }, uniqueness: true
    validates :role, format: { with: /member/ }
  end

  with_options on: :update do
    validates :nickname, format: { with: /\A[a-z0-9]+\z/ }, uniqueness: true
    validates :role, format: { with: /member/ }
  end

  accepts_nested_attributes_for :profile
end
