class Instrutor < ApplicationRecord
  validates :nome, :email, :profissao, presence: true
end
