class Chore < ApplicationRecord
  belongs_to :user
  belongs_to :task

  validates :status, acceptance: { accept: ["pending", "done", "uncomplete"] }
end
