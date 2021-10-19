class Disciplina < ApplicationRecord
	has_many :aulas, -> { order(:aula) }, dependent: :destroy

	has_many :forums, dependent: :destroy
	has_many :provas, dependent: :destroy
	has_many :avaliacaos, dependent: :destroy
	
	has_many :respostas, dependent: :destroy
	has_many :diarios, dependent: :destroy

	has_many :calendars



	validates_presence_of :name, :serie, :turma, :professor

	def serie_turma
		"#{serie} - #{turma} "
	end

	def serie_turma1
		"#{serie} - #{turma} - #{name}"
	end

end
