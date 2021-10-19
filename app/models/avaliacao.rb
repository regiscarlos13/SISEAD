class Avaliacao < ApplicationRecord
	default_scope {order('n')}

	belongs_to :disciplina

	has_many :respostas, dependent: :destroy

	accepts_nested_attributes_for :respostas
	
	validates_presence_of :name
	
	validates_uniqueness_of :n, scope: [:disciplina_id], message: "Você ja fez sua prova"


end
