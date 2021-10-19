class ApplicationController < ActionController::Base

	before_action :variables_enum 
	
	
	include Modal


	def variables_enum


		@disciplinas = Disciplina.all.order(:serie).order(:turma)
		@disciplina = Disciplina.where(id: cookies.encrypted[:selected_disciplina])[0]

		@professors = ApplicationRecord.professors.keys
		@series = ApplicationRecord.series.keys
		@turmas = ApplicationRecord.turmas.keys
		@tipos = ApplicationRecord.tipos.keys

		@created = 	'Registro Criado com Sucesso'
		@update = 	'Atualizado com Sucesso'
		@destroy = 	'Removido com Sucesso'
		
	end

end
