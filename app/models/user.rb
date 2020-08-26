class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :team
  validates :pseudo, uniqueness: true

  after_initialize :team_value

  def team_value
    self.team = nil
  end
end
