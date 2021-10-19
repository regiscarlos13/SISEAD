class Option < ApplicationRecord
	
	belongs_to :prova
	has_many :respostas

	has_one_attached :arq_resposta, dependent: :purge_later
	
	def campo_name
		name = 	'-'
	end



end
