class Chore < ApplicationRecord
  belongs_to :user
  belongs_to :task

  validates :done, acceptance: { accept: [ "A faire", "Fait", "Non fait"] }

  after_initialize :done_value

  def done_value
    self.done = "A faire"
  end
end
