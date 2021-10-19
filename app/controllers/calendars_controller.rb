class CalendarsController < ApplicationController


  def create
  	

  	@calendar = Calendar.where(disciplina_id: params[:calendar][:disciplina_id]).first_or_create(calendar_params).update_attribute(:data, params[:calendar][:data])

  	@disciplina = Disciplina.find(params[:calendar][:disciplina_id])
  	
	respond_to do |format|
        format.html { redirect_to calendario_path(@disciplina.serie), notice: @created }
    end  	

  end

  private

  def calendar_params
  	params.require(:calendar).permit(:data, :disciplina_id)
  end
end
