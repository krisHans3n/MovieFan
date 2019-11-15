require 'test_helper'

class SubplansControllerTest < ActionDispatch::IntegrationTest
  setup do
    @subplan = subplans(:one)
  end

  test "should get index" do
    get subplans_url
    assert_response :success
  end

  test "should get new" do
    get new_subplan_url
    assert_response :success
  end

  test "should create subplan" do
    assert_difference('Subplan.count') do
      post subplans_url, params: { subplan: { plantype: @subplan.plantype, recurring: @subplan.recurring } }
    end

    assert_redirected_to subplan_url(Subplan.last)
  end

  test "should show subplan" do
    get subplan_url(@subplan)
    assert_response :success
  end

  test "should get edit" do
    get edit_subplan_url(@subplan)
    assert_response :success
  end

  test "should update subplan" do
    patch subplan_url(@subplan), params: { subplan: { plantype: @subplan.plantype, recurring: @subplan.recurring } }
    assert_redirected_to subplan_url(@subplan)
  end

  test "should destroy subplan" do
    assert_difference('Subplan.count', -1) do
      delete subplan_url(@subplan)
    end

    assert_redirected_to subplans_url
  end
end
