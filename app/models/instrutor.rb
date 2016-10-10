class Instrutor < ApplicationRecord
  validates :nome, :email, :profissao, presence: true
  has_many :aulas

  accepts_nested_attributes_for :aulas, reject_if: :all_blank, allow_destroy: true
end
