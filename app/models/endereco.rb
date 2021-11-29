class Endereco < ApplicationRecord
  belongs_to :morador

  validates :rua, length: {in: 5..30}
  validates :complemento, length: {in: 2..10}
  validates_format_of :cep, with: /\A\d{5}-\d{3}\z/, presence: true,
                      message: 'deve ter formato XXXXX-XXX'
end
