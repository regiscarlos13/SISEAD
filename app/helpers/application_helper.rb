	module ApplicationHelper

		include TableHelper
		include BtnHelper

		def data(campo)
			if campo.present? 
				campo.strftime("%d/%m/%Y") 	
			end
		end

		def diario_day(form, day)
			a = form.select { |item| item.created_at.strftime("%d") == day } 
			a.present? ? 'P' : '-'
		end
		

		def yes_certa(campo)

			if campo == true
				'CORRETA'
			else
				'ERRADA'
			end

		end

		def select2(campo )
			javascript_tag 	"$(document).ready(function() {$('#{campo}').select2({placeholder: '--- Selecione ---'});});", type: 'text/javascript'
		end 	

		def inf_correta(campo, tipo)

			if tipo == 'Marcar'

				if campo == true
					label_tag('( ') + content_tag(:i, nil, class: "fas fa-check") + label_tag( ' )') 
				else
					'(  )'

				end

			else
				content_tag(:i, nil, class: "fas fa-pen")

			end
		end

		def inf_opcao(campo, tipo)

			if tipo == 'Marcar'

				if campo == true
					label_tag('( ') + label_tag( ' )') 
				else
					'(  )'

				end

			else
				content_tag(:i, nil, class: "fas fa-pen")

			end
		end

		def inf_correcao(campo, tipo, resposta, id, name,image)

			if tipo == 'Marcar'

				name = image_tag(image.variant(resize_to_limit: [50, 50])) if image.attached? 

				if campo == true and resposta.to_i == id
					content_tag(:pre, label_tag( '(') + content_tag(:i, nil, class: "fas fa-check") + label_tag(')') + ' - ' + name + ' - ' + content_tag(:i, nil, class: "fas fa-check")) 
				elsif campo == true 
					content_tag(:pre, label_tag( '( ) - ') + name + ' - ' + content_tag(:i, nil, class: "fas fa-check")) 
				elsif resposta.to_i == id
					content_tag(:pre, label_tag( '(') + content_tag(:i, nil, class: "fas fa-check") + label_tag( ')') + ' - ' + name + ' - ' + content_tag(:i, nil, class: "fas fa-times")) 
				else
					content_tag(:pre, label_tag( '( ') +  label_tag( ')') + ' - ' + name ) 
				end
			end
		end



		def color_th(campo)

			if campo.blank?
				@cor = 'text-white bg-danger' 
			else
				@cor = 'text-white bg-success'
			end
		end


		def label_field(field)
			if field.present? 
				@name = 'campo_name' 

			else 
				@name = 'name' 
			end 
		end

	end
