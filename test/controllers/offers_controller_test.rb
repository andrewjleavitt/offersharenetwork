require 'test_helper'

class OffersControllerTest < ActionController::TestCase
  setup do
    @offer = offers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:offers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create offer" do
    assert_difference('Offer.count') do
      post :create, offer: { active: @offer.active, customer_id: @offer.customer_id, description: @offer.description, expires: @offer.expires, image_url: @offer.image_url, name: @offer.name, published: @offer.published, redemption_value: @offer.redemption_value, reward_description: @offer.reward_description, reward_factor: @offer.reward_factor }
    end

    assert_redirected_to offer_path(assigns(:offer))
  end

  test "should show offer" do
    get :show, id: @offer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @offer
    assert_response :success
  end

  test "should update offer" do
    patch :update, id: @offer, offer: { active: @offer.active, customer_id: @offer.customer_id, description: @offer.description, expires: @offer.expires, image_url: @offer.image_url, name: @offer.name, published: @offer.published, redemption_value: @offer.redemption_value, reward_description: @offer.reward_description, reward_factor: @offer.reward_factor }
    assert_redirected_to offer_path(assigns(:offer))
  end

  test "should destroy offer" do
    assert_difference('Offer.count', -1) do
      delete :destroy, id: @offer
    end

    assert_redirected_to offers_path
  end
end
