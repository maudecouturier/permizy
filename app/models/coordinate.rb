class Coordinate < ApplicationRecord
  belongs_to :booking
  belongs_to :flashcard, optional: true

  # ajouter validates :)
end
