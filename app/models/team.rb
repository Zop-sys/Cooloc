class Team < ApplicationRecord
  has_many :users
  has_many :team_tasks
  has_many :tasks, through: :team_tasks
  validates :name, presence: true, uniqueness: true

  has_many :team_tasks
  has_many :tasks, through: :team_tasks
end
