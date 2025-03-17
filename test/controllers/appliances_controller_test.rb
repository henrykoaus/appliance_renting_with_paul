require "test_helper"

class AppliancesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @appliance = appliances(:one)
  end

  test "should get index" do
    get appliances_url
    assert_response :success
  end

  test "should get new" do
    get new_appliance_url
    assert_response :success
  end

  test "should create appliance" do
    assert_difference("Appliance.count") do
      post appliances_url, params: { appliance: { address: @appliance.address, availability: @appliance.availability, name: @appliance.name, overview: @appliance.overview, photo_url: @appliance.photo_url, price: @appliance.price, user_id: @appliance.user_id } }
    end

    assert_redirected_to appliance_url(Appliance.last)
  end

  test "should show appliance" do
    get appliance_url(@appliance)
    assert_response :success
  end

  test "should get edit" do
    get edit_appliance_url(@appliance)
    assert_response :success
  end

  test "should update appliance" do
    patch appliance_url(@appliance), params: { appliance: { address: @appliance.address, availability: @appliance.availability, name: @appliance.name, overview: @appliance.overview, photo_url: @appliance.photo_url, price: @appliance.price, user_id: @appliance.user_id } }
    assert_redirected_to appliance_url(@appliance)
  end

  test "should destroy appliance" do
    assert_difference("Appliance.count", -1) do
      delete appliance_url(@appliance)
    end

    assert_redirected_to appliances_url
  end
end
