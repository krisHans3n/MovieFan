require "application_system_test_case"

class MerchordersTest < ApplicationSystemTestCase
  setup do
    @merchorder = merchorders(:one)
  end

  test "visiting the index" do
    visit merchorders_url
    assert_selector "h1", text: "Merchorders"
  end

  test "creating a Merchorder" do
    visit merchorders_url
    click_on "New Merchorder"

    fill_in "Merchandises", with: @merchorder.merchandises_id
    fill_in "Orders", with: @merchorder.orders_id
    fill_in "Quantity", with: @merchorder.quantity
    click_on "Create Merchorder"

    assert_text "Merchorder was successfully created"
    click_on "Back"
  end

  test "updating a Merchorder" do
    visit merchorders_url
    click_on "Edit", match: :first

    fill_in "Merchandises", with: @merchorder.merchandises_id
    fill_in "Orders", with: @merchorder.orders_id
    fill_in "Quantity", with: @merchorder.quantity
    click_on "Update Merchorder"

    assert_text "Merchorder was successfully updated"
    click_on "Back"
  end

  test "destroying a Merchorder" do
    visit merchorders_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Merchorder was successfully destroyed"
  end
end
