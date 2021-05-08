require "test_helper"

class MeasurmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @measurment = measurments(:one)
  end

  test "should get index" do
    get measurments_url
    assert_response :success
  end

  test "should get new" do
    get new_measurment_url
    assert_response :success
  end

  test "should create measurment" do
    assert_difference('Measurment.count') do
      post measurments_url, params: { measurment: { bodyFat: @measurment.bodyFat, week: @measurment.week, weightKG: @measurment.weightKG, weightPounds: @measurment.weightPounds, weightStone: @measurment.weightStone } }
    end

    assert_redirected_to measurment_url(Measurment.last)
  end

  test "should show measurment" do
    get measurment_url(@measurment)
    assert_response :success
  end

  test "should get edit" do
    get edit_measurment_url(@measurment)
    assert_response :success
  end

  test "should update measurment" do
    patch measurment_url(@measurment), params: { measurment: { bodyFat: @measurment.bodyFat, week: @measurment.week, weightKG: @measurment.weightKG, weightPounds: @measurment.weightPounds, weightStone: @measurment.weightStone } }
    assert_redirected_to measurment_url(@measurment)
  end

  test "should destroy measurment" do
    assert_difference('Measurment.count', -1) do
      delete measurment_url(@measurment)
    end

    assert_redirected_to measurments_url
  end
end
