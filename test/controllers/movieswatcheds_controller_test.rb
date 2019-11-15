require 'test_helper'

class MovieswatchedsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @movieswatched = movieswatcheds(:one)
  end

  test "should get index" do
    get movieswatcheds_url
    assert_response :success
  end

  test "should get new" do
    get new_movieswatched_url
    assert_response :success
  end

  test "should create movieswatched" do
    assert_difference('Movieswatched.count') do
      post movieswatcheds_url, params: { movieswatched: { movies: @movieswatched.movies } }
    end

    assert_redirected_to movieswatched_url(Movieswatched.last)
  end

  test "should show movieswatched" do
    get movieswatched_url(@movieswatched)
    assert_response :success
  end

  test "should get edit" do
    get edit_movieswatched_url(@movieswatched)
    assert_response :success
  end

  test "should update movieswatched" do
    patch movieswatched_url(@movieswatched), params: { movieswatched: { movies: @movieswatched.movies } }
    assert_redirected_to movieswatched_url(@movieswatched)
  end

  test "should destroy movieswatched" do
    assert_difference('Movieswatched.count', -1) do
      delete movieswatched_url(@movieswatched)
    end

    assert_redirected_to movieswatcheds_url
  end
end
