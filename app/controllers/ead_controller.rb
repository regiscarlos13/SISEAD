class EadController < ApplicationController
	
	def index
		unless cookies.encrypted[:selected_disciplina].present? 
			redirect_to root_path

		end
		unless cookies.encrypted[:numero].present?
			redirect_to root_path
		end

	end


end
