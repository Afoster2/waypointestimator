require "test_helper"

class BoatModelsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @boat_model = boat_models(:one)
  end

  test "should get index" do
    get boat_models_url
    assert_response :success
  end

  test "should get new" do
    get new_boat_model_url
    assert_response :success
  end

  test "should create boat_model" do
    assert_difference("BoatModel.count") do
      post boat_models_url, params: { boat_model: {  } }
    end

    assert_redirected_to boat_model_url(BoatModel.last)
  end

  test "should show boat_model" do
    get boat_model_url(@boat_model)
    assert_response :success
  end

  test "should get edit" do
    get edit_boat_model_url(@boat_model)
    assert_response :success
  end

  test "should update boat_model" do
    patch boat_model_url(@boat_model), params: { boat_model: {  } }
    assert_redirected_to boat_model_url(@boat_model)
  end

  test "should destroy boat_model" do
    assert_difference("BoatModel.count", -1) do
      delete boat_model_url(@boat_model)
    end

    assert_redirected_to boat_models_url
  end
end
