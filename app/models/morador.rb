require "cpf_cnpj"
class Morador < ApplicationRecord
  has_many :encomendas
  
  validates :nome, presence: true, length: {in: 5..50}
  validates :casanum, presence:true, numericality:true
  validates :bloco, presence: true
  validates :contato, presence: true, numericality:true, length:{minimum: 9}
  validates :cpf, presence: true, uniqueness: true
  validate :cpf_valido

  def cpf_valido
    if cpf.present? && !CPF.valid?(cpf)
      errors.add(:cpf, "formato ou numero errado")
    end
  end
end
