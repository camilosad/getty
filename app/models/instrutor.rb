class Instrutor < ApplicationRecord
  validates :nome, :email, :profissao, presence: true
  has_many :aulas, dependent: :destroy
  has_many :instancia_aulas, through: :aulas

  accepts_nested_attributes_for :aulas, reject_if: :all_blank, allow_destroy: true
end
