class Prova < ApplicationRecord

	belongs_to :disciplina

	has_rich_text :pergunta

	has_many :avaliacaos
	has_many :respostas
	

	has_many :options, dependent: :destroy


	validates_presence_of :pergunta
	
	accepts_nested_attributes_for :options, reject_if: :all_blank, allow_destroy: true

	


end
