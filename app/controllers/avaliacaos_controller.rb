class AvaliacaosController < ApplicationController

	before_action :set_avaliacao, only: [:show, :aluno_prova, :update]
	before_action :set_disciplina, only: [:show, :aluno_prova]
	before_action :set_provas, only: [:show, :aluno_prova]

	layout 'prova'

	def show
		@resposta = Resposta.new

	end
 

	def create
		@avaliacao = @disciplina.avaliacaos.create(avaliacao_params)
		
		respond_to do |format|
			if @avaliacao.save
				format.html { redirect_to ead_index_path, notice: "Prova Realizada com Sucesso!" }
			else
				format.html { redirect_to request.referrer, alert: "Voce ja realizou sua prova"  }
				#format.html { render :aluno }
				 
			end
		end
	end

	def aluno
		@q = 0
		@provas = Prova.where(disciplina_id: params[:id])

		@avaliacao = Avaliacao.new
		@avaliacao.respostas.build


	end


	def aluno_prova
		respond_to do |format|
			format.html {
				render layout: 'blank'
			}

			format.pdf {
				render pdf: 'Prova',
				template: 'avaliacaos/print/prova'
				#save_to_file: Rails.root.join('public','pdfs', '#{@post.id}' + ".pdf")
			}
		end


		
	end

	def correcao
		@disciplina = Disciplina.find(params[:id])

		respond_to do |format|
			format.html {
				render layout: 'blank'
			}

			format.pdf {
				render template: 'avaliacaos/print/alunos',
				pdf: 'Alunos'
			}
		end


	end

	def update
		@avaliacao.update(avaliacao_params)	
		respond_to do |format|
			format.js {render inline: "location.reload();" }
		end
	end

	private

	def set_avaliacao
		@avaliacao = Avaliacao.find(params[:id])
	end

	def set_disciplina
		@disciplina = Disciplina.find(params[:disciplina_id])
	end
	
	def set_provas
		@q = 0
		@provas = @avaliacao.disciplina.provas

	end	

	def avaliacao_params
		params.require(:avaliacao).permit(:name, :n, :disciplina_id, :nota, {
			respostas_attributes: [:id, :respondido, :avaliacao_id, :disciplina_id, :prova_id] })
	end

end
