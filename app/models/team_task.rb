class TeamTask < ApplicationRecord
  belongs_to :team
  belongs_to :task
end
