require 'test_helper'

class SubscriptionpaymentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @subscriptionpayment = subscriptionpayments(:one)
  end

  test "should get index" do
    get subscriptionpayments_url
    assert_response :success
  end

  test "should get new" do
    get new_subscriptionpayment_url
    assert_response :success
  end

  test "should create subscriptionpayment" do
    assert_difference('Subscriptionpayment.count') do
      post subscriptionpayments_url, params: { subscriptionpayment: { subplans_id: @subscriptionpayment.subplans_id, users_id: @subscriptionpayment.users_id } }
    end

    assert_redirected_to subscriptionpayment_url(Subscriptionpayment.last)
  end

  test "should show subscriptionpayment" do
    get subscriptionpayment_url(@subscriptionpayment)
    assert_response :success
  end

  test "should get edit" do
    get edit_subscriptionpayment_url(@subscriptionpayment)
    assert_response :success
  end

  test "should update subscriptionpayment" do
    patch subscriptionpayment_url(@subscriptionpayment), params: { subscriptionpayment: { subplans_id: @subscriptionpayment.subplans_id, users_id: @subscriptionpayment.users_id } }
    assert_redirected_to subscriptionpayment_url(@subscriptionpayment)
  end

  test "should destroy subscriptionpayment" do
    assert_difference('Subscriptionpayment.count', -1) do
      delete subscriptionpayment_url(@subscriptionpayment)
    end

    assert_redirected_to subscriptionpayments_url
  end
end
