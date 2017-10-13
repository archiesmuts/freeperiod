require 'test_helper'

class PayAgreementsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pay_agreement = pay_agreements(:one)
  end

  test "should get index" do
    get pay_agreements_url
    assert_response :success
  end

  test "should get new" do
    get new_pay_agreement_url
    assert_response :success
  end

  test "should create pay_agreement" do
    assert_difference('PayAgreement.count') do
      post pay_agreements_url, params: { pay_agreement: { comment: @pay_agreement.comment, discount: @pay_agreement.discount, fee_id: @pay_agreement.fee_id, user_registration_id: @pay_agreement.user_registration_id } }
    end

    assert_redirected_to pay_agreement_url(PayAgreement.last)
  end

  test "should show pay_agreement" do
    get pay_agreement_url(@pay_agreement)
    assert_response :success
  end

  test "should get edit" do
    get edit_pay_agreement_url(@pay_agreement)
    assert_response :success
  end

  test "should update pay_agreement" do
    patch pay_agreement_url(@pay_agreement), params: { pay_agreement: { comment: @pay_agreement.comment, discount: @pay_agreement.discount, fee_id: @pay_agreement.fee_id, user_registration_id: @pay_agreement.user_registration_id } }
    assert_redirected_to pay_agreement_url(@pay_agreement)
  end

  test "should destroy pay_agreement" do
    assert_difference('PayAgreement.count', -1) do
      delete pay_agreement_url(@pay_agreement)
    end

    assert_redirected_to pay_agreements_url
  end
end
