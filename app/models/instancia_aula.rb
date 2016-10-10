class InstanciaAula < ApplicationRecord
  belongs_to :aula

  validates :inicio, :fim, presence: true
end
