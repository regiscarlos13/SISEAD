class Forum < ApplicationRecord
  belongs_to :disciplina
  belongs_to :aula

  has_many :responders, dependent: :destroy

  has_rich_text :duvida

  validates_presence_of :aluno, :topico, :duvida
end
