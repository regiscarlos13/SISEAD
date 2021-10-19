class AdminController < ApplicationController

	http_basic_authenticate_with name: "administrador", password: "admin"

	before_action :set_disciplina, only: [:index]



	layout 'blank'


	def index
		
	end


	def calendario

		@disciplina = Disciplina.where(serie: params[:id])
		@calendar = Calendar.new


	end

	def destroy 
		@disciplina = Disciplina.find(params[:id])
		@disciplina.avaliacaos.destroy_all

		respond_to do |format|
			format.html { redirect_to admin_index_path, notice: 'Provas Apagadas com Sucesso' }
		end
	end

	def provas_delete
		@disciplina = Disciplina.find(params[:id])
		@disciplina.provas.destroy_all
		respond_to do |format|
			format.html { redirect_to admin_index_path, notice: 'Prova removidas com Sucesso' }
		end

	end

	private

	def set_disciplina
		@disciplinas = Disciplina.all
	end

end
