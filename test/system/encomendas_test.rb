require "application_system_test_case"

class EncomendasTest < ApplicationSystemTestCase
  setup do
    @encomenda = encomendas(:one)
  end

  test "visiting the index" do
    visit encomendas_url
    assert_selector "h1", text: "Encomendas"
  end

  test "creating a Encomenda" do
    visit encomendas_url
    click_on "New Encomenda"

    click_on "Create Encomenda"

    assert_text "Encomenda was successfully created"
    click_on "Back"
  end

  test "updating a Encomenda" do
    visit encomendas_url
    click_on "Edit", match: :first

    click_on "Update Encomenda"

    assert_text "Encomenda was successfully updated"
    click_on "Back"
  end

  test "destroying a Encomenda" do
    visit encomendas_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Encomenda was successfully destroyed"
  end
end
