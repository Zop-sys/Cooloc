class Team < ApplicationRecord
  has_many :users
  validates :name, presence: true, uniqueness: true

    after_initialize :team_value

  def team_value
    self.team = nil
  end
end
