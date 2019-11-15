require 'test_helper'

class MerchordersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @merchorder = merchorders(:one)
  end

  test "should get index" do
    get merchorders_url
    assert_response :success
  end

  test "should get new" do
    get new_merchorder_url
    assert_response :success
  end

  test "should create merchorder" do
    assert_difference('Merchorder.count') do
      post merchorders_url, params: { merchorder: { merchandises_id: @merchorder.merchandises_id, orders_id: @merchorder.orders_id, quantity: @merchorder.quantity } }
    end

    assert_redirected_to merchorder_url(Merchorder.last)
  end

  test "should show merchorder" do
    get merchorder_url(@merchorder)
    assert_response :success
  end

  test "should get edit" do
    get edit_merchorder_url(@merchorder)
    assert_response :success
  end

  test "should update merchorder" do
    patch merchorder_url(@merchorder), params: { merchorder: { merchandises_id: @merchorder.merchandises_id, orders_id: @merchorder.orders_id, quantity: @merchorder.quantity } }
    assert_redirected_to merchorder_url(@merchorder)
  end

  test "should destroy merchorder" do
    assert_difference('Merchorder.count', -1) do
      delete merchorder_url(@merchorder)
    end

    assert_redirected_to merchorders_url
  end
end
