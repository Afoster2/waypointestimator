require "application_system_test_case"

class BoatModelsTest < ApplicationSystemTestCase
  setup do
    @boat_model = boat_models(:one)
  end

  test "visiting the index" do
    visit boat_models_url
    assert_selector "h1", text: "Boat models"
  end

  test "should create boat model" do
    visit boat_models_url
    click_on "New boat model"

    click_on "Create Boat model"

    assert_text "Boat model was successfully created"
    click_on "Back"
  end

  test "should update Boat model" do
    visit boat_model_url(@boat_model)
    click_on "Edit this boat model", match: :first

    click_on "Update Boat model"

    assert_text "Boat model was successfully updated"
    click_on "Back"
  end

  test "should destroy Boat model" do
    visit boat_model_url(@boat_model)
    click_on "Destroy this boat model", match: :first

    assert_text "Boat model was successfully destroyed"
  end
end
