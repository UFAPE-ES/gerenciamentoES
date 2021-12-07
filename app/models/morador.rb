require "cpf_cnpj"
class Morador < ApplicationRecord
  has_many :encomendas, dependent: :destroy
  has_one :endereco, dependent: :destroy
  accepts_nested_attributes_for :endereco, allow_destroy: true
  
  validates :nome, presence: true, length: {in: 5..50}
  validates :casanum, presence:true, numericality:true
  validates :bloco, presence: true
  validates :telefone, presence: true, numericality:true, length:{minimum: 9}
  validates :cpf, presence: true, uniqueness: true
  validate :cpf_valido

  def cpf_valido
    if cpf.present? && !CPF.valid?(cpf)
      errors.add(:cpf, "formato ou numero errado")
    end
  end
end
