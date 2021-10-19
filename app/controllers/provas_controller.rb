class ProvasController < ApplicationController

  before_action :set_disciplina, only: [:create, :destroy]

  layout 'blank'

  def new
   @disciplina = Disciplina.find(params[:id])
   @provas = Prova.where(disciplina_id: @disciplina)

   respond_to do |format|
      format.html {
        render layout: 'blank'
      }

      format.pdf {
        render pdf: 'Prova',
        template: 'provas/new'
      }
 end

end
 def create


  @prova = @disciplina.provas.create(prova_params)
  respond_to do |format|
    if @prova.save
      format.html { redirect_to provas_path(@disciplina), notice: @created }
    else
      format.html { redirect_to request.referrer, alert: "Ocorreu um erro ao salvar a prova"  }
    end
  end
end

def destroy

 @prova = @disciplina.provas.find(params[:id])

 @prova.destroy

 respond_to do |format|
  if @prova.destroyed?
    format.html { redirect_to provas_path(@disciplina), notice: 'Questão Removida com Sucesso' }
  else
    format.html { redirect_to provas_path(@disciplina), alert: 'Há provas respondidas com essa questão' }

  end
end

 #redirect_to provas_path(@disciplina)

end

private

def set_disciplina
 @disciplina = Disciplina.find(params[:disciplina_id])


end


def prova_params
  params.require(:prova).permit(:pergunta,
    options_attributes: [:id, :name, :tipo, :arq_resposta, :correta, :prova_id, :_destroy])
end

end
