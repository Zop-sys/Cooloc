class Task < ApplicationRecord
  has_many :chores

  validates :title, :intensity, :frequency, :room, presence: true

  validates :room, acceptance: { accept: ["Salon", "Salle de Bain", "Toilette", "Autres", "Cuisine", "Exterieur"] }

  validates :frequency, acceptance: { accept: ["Mensuel", "Hebdomadaire", "Journalier"] }
end
