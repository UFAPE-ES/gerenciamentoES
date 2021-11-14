class Encomenda < ApplicationRecord
  has_one :funcionario, dependent: :destroy
  has_one :morador, dependent: :destroy

  validates :remetente, presence: true, length: {in: 5..50}
  validate :data_entrega

  def data_entrega
    if data.present? && data < Date.today
      errors.add(:data, "nao pode ser no passado")
    end
  end
end
