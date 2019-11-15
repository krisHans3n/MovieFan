require "application_system_test_case"

class SubplansTest < ApplicationSystemTestCase
  setup do
    @subplan = subplans(:one)
  end

  test "visiting the index" do
    visit subplans_url
    assert_selector "h1", text: "Subplans"
  end

  test "creating a Subplan" do
    visit subplans_url
    click_on "New Subplan"

    fill_in "Plantype", with: @subplan.plantype
    fill_in "Recurring", with: @subplan.recurring
    click_on "Create Subplan"

    assert_text "Subplan was successfully created"
    click_on "Back"
  end

  test "updating a Subplan" do
    visit subplans_url
    click_on "Edit", match: :first

    fill_in "Plantype", with: @subplan.plantype
    fill_in "Recurring", with: @subplan.recurring
    click_on "Update Subplan"

    assert_text "Subplan was successfully updated"
    click_on "Back"
  end

  test "destroying a Subplan" do
    visit subplans_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Subplan was successfully destroyed"
  end
end
