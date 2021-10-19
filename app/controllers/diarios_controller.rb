class DiariosController < ApplicationController
	layout 'blank'

  def diario
  	unless params[:start].present? and params[:end].present?
  		params[:start] = Date.today.at_beginning_of_month
  		params[:end] = Date.today.at_end_of_month
  	end
  		@diarios = Diario.where(disciplina_id: params[:id]).where("Date(created_at)  BETWEEN ? AND ?", params[:start], params[:end]).order(:n)
  	
  end
end