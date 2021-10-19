module Modal

	def set_senha

		cookies.encrypted[:selected_disciplina] = params[:disciplina_select]
		cookies.encrypted[:numero] = params[:numero]
		@disciplina = Disciplina.where(id: cookies.encrypted[:selected_disciplina])[0]

		if @disciplina.present? and params[:numero].present?
			@senha = "turma0#{@disciplina.serie}"
			@senha = @senha.delete! 'º'
			cookies.encrypted[:senha] = @senha


			case @disciplina.turma

			when 'I'
				@senhainfantil = 'infantil01'
			when 'II'
				@senhainfantil = 'infantil02'
			when 'III'
				@senhainfantil = 'infantil03'
			when 'IV'
				@senhainfantil = 'infantil04'
			else
				@senhainfantil = 'infantil05'
			end

		end

		#@diario = Diario.where(disciplina_id: cookies.encrypted[:selected_disciplina]).where(created_at: Time.current.all_day).find_or_create_by(n: cookies.encrypted[:numero])

		respond_to do |format|
			if params[:senha] == @senha
				flash[:notice] = "Bem-vindo a sua Sala de Aula"
				format.js   { render js: "window.location='#{ ead_index_path }'" }

			elsif @disciplina.serie == 'Infantil' and params[:senha] == @senhainfantil



				#@disciplina.serie == 'Infantil'
				flash[:notice] = "Bem-vindo a sua Sala de Aula"
				format.js   { render js: "window.location='#{ ead_index_path }'" }					
			else

				flash[:alert] = 'Você não tem autorização!'
				format.js {render inline: "location.reload();" }
			end
		end
	end	


	def set_mudar_disciplina
		cookies.encrypted[:selected_disciplina] = params[:disciplina_select]
		#@diario = Diario.where(disciplina_id: cookies.encrypted[:selected_disciplina]).where(created_at: Time.current.all_day).find_or_create_by(n: cookies.encrypted[:numero])
		respond_to do |format|
			format.js   { render js: "window.location='#{ ead_index_path }'" }

		end
	end	



	def set_professor_senha

		cookies.encrypted[:selected_professor] = params[:professor_select]

		respond_to do |format|
			case params[:senha_professor]
			when 'educaprofessor'
				flash[:notice] = "Bem-vindo ao planejamento"
				format.js   { render js: "window.location='#{ planejamento_path }'" }
			else
				flash[:alert] = 'Você não tem autorização!'
				format.js {render inline: "location.reload();" }
			end
		end

	end






end