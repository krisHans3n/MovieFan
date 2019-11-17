require "application_system_test_case"

class SubscriptionpaymentsTest < ApplicationSystemTestCase
  setup do
    @subscriptionpayment = subscriptionpayments(:one)
  end

  test "visiting the index" do
    visit subscriptionpayments_url
    assert_selector "h1", text: "Subscriptionpayments"
  end

  test "creating a Subscriptionpayment" do
    visit subscriptionpayments_url
    click_on "New Subscriptionpayment"

    fill_in "Subplans", with: @subscriptionpayment.subplans_id
    fill_in "Users", with: @subscriptionpayment.users_id
    click_on "Create Subscriptionpayment"

    assert_text "Subscriptionpayment was successfully created"
    click_on "Back"
  end

  test "updating a Subscriptionpayment" do
    visit subscriptionpayments_url
    click_on "Edit", match: :first

    fill_in "Subplans", with: @subscriptionpayment.subplans_id
    fill_in "Users", with: @subscriptionpayment.users_id
    click_on "Update Subscriptionpayment"

    assert_text "Subscriptionpayment was successfully updated"
    click_on "Back"
  end

  test "destroying a Subscriptionpayment" do
    visit subscriptionpayments_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Subscriptionpayment was successfully destroyed"
  end
end
