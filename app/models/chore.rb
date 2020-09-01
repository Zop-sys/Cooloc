class Chore < ApplicationRecord
  belongs_to :user
  belongs_to :task

  validates :status, acceptance: { accept: ["pending", "done", "uncomplete"] }

  scope :for_planning, ->(month = Date.today.at_beginning_of_month.month) {
    where(month_number: month)
  }
end
