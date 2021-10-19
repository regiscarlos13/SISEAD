class Responder < ApplicationRecord
  belongs_to :forum

  has_rich_text :resposta

  validates_presence_of :resposta
end
