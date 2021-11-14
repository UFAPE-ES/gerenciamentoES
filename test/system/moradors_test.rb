require "application_system_test_case"

class MoradorsTest < ApplicationSystemTestCase
  setup do
    @morador = moradors(:one)
  end

  test "visiting the index" do
    visit moradors_url
    assert_selector "h1", text: "Moradors"
  end

  test "creating a Morador" do
    visit moradors_url
    click_on "New Morador"

    fill_in "Bloco", with: @morador.bloco
    fill_in "Casanum", with: @morador.casanum
    fill_in "Contato", with: @morador.contato
    fill_in "Cpf", with: @morador.cpf
    fill_in "Nome", with: @morador.nome
    click_on "Create Morador"

    assert_text "Morador was successfully created"
    click_on "Back"
  end

  test "updating a Morador" do
    visit moradors_url
    click_on "Edit", match: :first

    fill_in "Bloco", with: @morador.bloco
    fill_in "Casanum", with: @morador.casanum
    fill_in "Contato", with: @morador.contato
    fill_in "Cpf", with: @morador.cpf
    fill_in "Nome", with: @morador.nome
    click_on "Update Morador"

    assert_text "Morador was successfully updated"
    click_on "Back"
  end

  test "destroying a Morador" do
    visit moradors_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Morador was successfully destroyed"
  end
end
