class User < ApplicationRecord
  has_many :encomendas
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nome, presence: true, length: {in: 5..40}
  validates :password_confirmation, presence: true
end
