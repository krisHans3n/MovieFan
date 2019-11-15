require "application_system_test_case"

class MovieswatchedsTest < ApplicationSystemTestCase
  setup do
    @movieswatched = movieswatcheds(:one)
  end

  test "visiting the index" do
    visit movieswatcheds_url
    assert_selector "h1", text: "Movieswatcheds"
  end

  test "creating a Movieswatched" do
    visit movieswatcheds_url
    click_on "New Movieswatched"

    fill_in "Movies", with: @movieswatched.movies
    click_on "Create Movieswatched"

    assert_text "Movieswatched was successfully created"
    click_on "Back"
  end

  test "updating a Movieswatched" do
    visit movieswatcheds_url
    click_on "Edit", match: :first

    fill_in "Movies", with: @movieswatched.movies
    click_on "Update Movieswatched"

    assert_text "Movieswatched was successfully updated"
    click_on "Back"
  end

  test "destroying a Movieswatched" do
    visit movieswatcheds_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Movieswatched was successfully destroyed"
  end
end
