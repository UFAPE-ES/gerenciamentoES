class Morador < ApplicationRecord
  has_many :encomendas
  
  validates :nome, presence: true, length: {in: 5..50}
  validates :casanum, presence:true, numericality:true
  validates :bloco, presence: true
  validates :contato, presence: true, numericality:true, length:{minimum: 9}
  validates :cpf, presence: true, uniqueness: true
end
