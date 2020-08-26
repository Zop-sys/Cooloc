class Chore < ApplicationRecord
  belongs_to :user
  belongs_to :task

  # after_initialize :done_value

  # def done_value
  #   self.done = false
  # end
end
