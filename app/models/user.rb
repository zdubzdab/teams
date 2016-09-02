class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable,
  :validatable

  has_many :team_users
  has_many :teams, through: :team_users
  belongs_to :role

  validates :name, presence: true
  validates :email, presence: true
end
