class Team < ApplicationRecord
  has_many :users
  validates :name, presence: true, uniqueness: true
end
