class Diario < ApplicationRecord
  belongs_to :disciplina

  validates_presence_of :n
end
