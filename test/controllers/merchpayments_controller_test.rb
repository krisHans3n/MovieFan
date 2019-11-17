require 'test_helper'

class MerchpaymentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @merchpayment = merchpayments(:one)
  end

  test "should get index" do
    get merchpayments_url
    assert_response :success
  end

  test "should get new" do
    get new_merchpayment_url
    assert_response :success
  end

  test "should create merchpayment" do
    assert_difference('Merchpayment.count') do
      post merchpayments_url, params: { merchpayment: { merchorders_id: @merchpayment.merchorders_id, users_id: @merchpayment.users_id } }
    end

    assert_redirected_to merchpayment_url(Merchpayment.last)
  end

  test "should show merchpayment" do
    get merchpayment_url(@merchpayment)
    assert_response :success
  end

  test "should get edit" do
    get edit_merchpayment_url(@merchpayment)
    assert_response :success
  end

  test "should update merchpayment" do
    patch merchpayment_url(@merchpayment), params: { merchpayment: { merchorders_id: @merchpayment.merchorders_id, users_id: @merchpayment.users_id } }
    assert_redirected_to merchpayment_url(@merchpayment)
  end

  test "should destroy merchpayment" do
    assert_difference('Merchpayment.count', -1) do
      delete merchpayment_url(@merchpayment)
    end

    assert_redirected_to merchpayments_url
  end
end
