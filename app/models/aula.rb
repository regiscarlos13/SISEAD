class Aula < ApplicationRecord
belongs_to :disciplina

has_many :forums, dependent: :destroy

has_rich_text :agenda

has_many_attached :arquivos, dependent: :purge_later

validates_presence_of :aula, :conteudo, :data, scope: [:dp, :year]

validates_uniqueness_of :aula, scope: [:disciplina]


private

def name_aula
	"Aula - #{aula}"
end
  
end
