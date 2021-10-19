class RespostasController < ApplicationController

	def create

		#@resposta = Resposta.where(avaliacao_id: params[:resposta][:avaliacao_id], prova_id: params[:resposta][:prova_id]).first_or_create(resposta_params).update_attribute(:respondido, params[:resposta][:respondido])

	end


	def update
		@resposta = Resposta.find(params[:id]).update(resposta_params)
		respond_to do |format|
			format.js {render inline: "location.reload();" }
		end 
	end

	private

	def resposta_params
		params.require(:resposta).permit(:respondido, :disciplina_id, :prova_id, :avaliacao_id, :nota, :certa)
	end


end