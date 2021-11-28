class Produto < ApplicationRecord
  belongs_to :encomenda

  validates :nome, presence: true, length: {in: 5..50}
end
