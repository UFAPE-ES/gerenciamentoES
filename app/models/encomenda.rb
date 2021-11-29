class Encomenda < ApplicationRecord
  belongs_to :funcionario
  belongs_to :morador

  has_many :produtos, dependent: :destroy

  validates :remetente, presence: true, length: {in: 5..50}
  validate :data_entrega

  def data_entrega
    if data.present? && data < Date.today
      errors.add(:data, "nao pode ser no passado")
    end
  end
end
