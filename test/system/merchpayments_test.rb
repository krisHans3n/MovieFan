require "application_system_test_case"

class MerchpaymentsTest < ApplicationSystemTestCase
  setup do
    @merchpayment = merchpayments(:one)
  end

  test "visiting the index" do
    visit merchpayments_url
    assert_selector "h1", text: "Merchpayments"
  end

  test "creating a Merchpayment" do
    visit merchpayments_url
    click_on "New Merchpayment"

    fill_in "Merchorders", with: @merchpayment.merchorders_id
    fill_in "Users", with: @merchpayment.users_id
    click_on "Create Merchpayment"

    assert_text "Merchpayment was successfully created"
    click_on "Back"
  end

  test "updating a Merchpayment" do
    visit merchpayments_url
    click_on "Edit", match: :first

    fill_in "Merchorders", with: @merchpayment.merchorders_id
    fill_in "Users", with: @merchpayment.users_id
    click_on "Update Merchpayment"

    assert_text "Merchpayment was successfully updated"
    click_on "Back"
  end

  test "destroying a Merchpayment" do
    visit merchpayments_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Merchpayment was successfully destroyed"
  end
end
