require 'test_helper'

class OfferSharesControllerTest < ActionController::TestCase
  setup do
    @offer_share = offer_shares(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:offer_shares)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create offer_share" do
    assert_difference('OfferShare.count') do
      post :create, offer_share: { advocate_id: @offer_share.advocate_id, code: @offer_share.code, offer_id: @offer_share.offer_id }
    end

    assert_redirected_to offer_share_path(assigns(:offer_share))
  end

  test "should show offer_share" do
    get :show, id: @offer_share
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @offer_share
    assert_response :success
  end

  test "should update offer_share" do
    patch :update, id: @offer_share, offer_share: { advocate_id: @offer_share.advocate_id, code: @offer_share.code, offer_id: @offer_share.offer_id }
    assert_redirected_to offer_share_path(assigns(:offer_share))
  end

  test "should destroy offer_share" do
    assert_difference('OfferShare.count', -1) do
      delete :destroy, id: @offer_share
    end

    assert_redirected_to offer_shares_path
  end
end
