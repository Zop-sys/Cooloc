class Chore < ApplicationRecord
  belongs_to :user
  belongs_to :task

  validates :done, acceptance: { accept: [ "A faire", "Fait", "Non fait"] }
end
