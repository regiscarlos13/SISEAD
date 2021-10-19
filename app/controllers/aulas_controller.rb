class AulasController < ApplicationController

 before_action :set_disciplina, only: [:show]

 def create


  @disciplina = Disciplina.find(params[:disciplina_id])
  @aula = @disciplina.aulas.create(comment_params)

  respond_to do |format|
    if @aula.save
      format.html { redirect_to disciplina_path(@disciplina), notice: @created }
    else
      format.html { redirect_to request.referrer, alert: "Ocorreu um erro ao salvar a aula"  }
    end
  end

end

def destroy
  @disciplina = Disciplina.find(params[:disciplina_id])
  @aula = @disciplina.aulas.find(params[:id])



  @aula.destroy
  redirect_to disciplina_path(@disciplina)
end

def show
  unless cookies.encrypted[:selected_disciplina].present?
    redirect_to root_path
  else
    render layout: 'ead'
  end


end


private
    # Use callbacks to share common setup or constraints between actions.
    def set_disciplina
      @aula = Aula.find(params[:id])
    end

    def comment_params
      params.require(:aula).permit(:aula, :agenda, :conteudo, :video, :data, arquivos: [] )
    end

  end
