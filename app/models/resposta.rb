class Resposta < ApplicationRecord

	belongs_to :avaliacao, optional: true
	belongs_to :disciplina, optional: true
	belongs_to :prova, optional: true
	belongs_to :option, optional: true


	#validates_uniqueness_of :prova, scope: [:disciplina, :avaliacao]
	#validates_presence_of :respondido


	before_save :save_resposta
	

	def is_number?(object)
		true if Float(object) rescue false
	end


	def save_resposta

		resposta = self.respondido

		if is_number?(resposta) == true

			id_resposta = self.respondido.to_i

			#option = Option.where(id: id_resposta)
			option = Option.find(id_resposta)
			
			self.certa = option.correta

			
		end


	end



end
