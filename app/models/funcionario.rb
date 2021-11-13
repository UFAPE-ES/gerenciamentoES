class Funcionario < ApplicationRecord
  validates :nome, presence: true, length: {in: 5..40}
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :senha, presence:true, confirmation: true, length: {in:8..25}
  validates :senha_confirmation, presence: true
  validate :senha_uppercase, :senha_lower_case, :senha_special_char

  def senha_uppercase
    return if !!senha.match(/\p{Upper}/)
    errors.add(:senha,"deve conter letra maiuscula")
  end

  def senha_lower_case
    return if !!senha.match(/\p{Lower}/)
    errors.add(:senha,"deve conter letra minuscula")
  end

  def senha_special_char
    special = "?<>',?[]}{=-)(*&@^%$#`~{}!"
    regex = /[#{special.gsub(/./){|char| "\\#{char}"}}]/
    return if senha =~ regex
    errors.add(:senha,"deve conter caractere especial (ex: @,$,...)")
  end
end
