class Team < ApplicationRecord
  has_many :users
  validates :name, presence: true, uniqueness: true

  has_many :team_tasks
  has_many :tasks, through: :team_tasks
end
