class ApplicationRecord < ActiveRecord::Base
	self.abstract_class = true

	enum professor: [:'Aline e Patricia', :'Aline e Rose', :'Ana Paula',:'Emanuelle',:'Francisca',:'Glauciene e Nágila',
		:'kaio',:'Keuly',:'Luiza',:'Marciana',:'Michele',:'Naiara e Neta',:'Neide', :Thialisson, :Fran, :Narya, :Marconia,
		:Nara, :Tesca
	]
	enum serie: [:'1º', :'2º', :'3º', :'4º', :'5º', :'6º', :'7º', :'8º', :'9º',:'Infantil']
	enum turma: [:A, :B, :C, :D, :I, :II, :III, :IV, :V]


	enum tipo: [:Marcar, :Texto]

	


end

