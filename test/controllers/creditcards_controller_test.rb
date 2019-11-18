require 'test_helper'

class CreditcardsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @creditcard = creditcards(:one)
  end

  test "should get index" do
    get creditcards_url
    assert_response :success
  end

  test "should get new" do
    get new_creditcard_url
    assert_response :success
  end

  test "should create creditcard" do
    assert_difference('Creditcard.count') do
      post creditcards_url, params: { creditcard: { expdate: @creditcard.expdate, nameoncard: @creditcard.nameoncard, number: @creditcard.number, organisationtype: @creditcard.organisationtype, users_id: @creditcard.users_id } }
    end

    assert_redirected_to creditcard_url(Creditcard.last)
  end

  test "should show creditcard" do
    get creditcard_url(@creditcard)
    assert_response :success
  end

  test "should get edit" do
    get edit_creditcard_url(@creditcard)
    assert_response :success
  end

  test "should update creditcard" do
    patch creditcard_url(@creditcard), params: { creditcard: { expdate: @creditcard.expdate, nameoncard: @creditcard.nameoncard, number: @creditcard.number, organisationtype: @creditcard.organisationtype, users_id: @creditcard.users_id } }
    assert_redirected_to creditcard_url(@creditcard)
  end

  test "should destroy creditcard" do
    assert_difference('Creditcard.count', -1) do
      delete creditcard_url(@creditcard)
    end

    assert_redirected_to creditcards_url
  end
end
