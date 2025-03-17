require "application_system_test_case"

class AppliancesTest < ApplicationSystemTestCase
  setup do
    @appliance = appliances(:one)
  end

  test "visiting the index" do
    visit appliances_url
    assert_selector "h1", text: "Appliances"
  end

  test "should create appliance" do
    visit appliances_url
    click_on "New appliance"

    fill_in "Address", with: @appliance.address
    fill_in "Availability", with: @appliance.availability
    fill_in "Favourite list", with: @appliance.favourite_list_id
    fill_in "Name", with: @appliance.name
    fill_in "Overview", with: @appliance.overview
    fill_in "Photo url", with: @appliance.photo_url
    fill_in "Price", with: @appliance.price
    fill_in "User", with: @appliance.user_id
    click_on "Create Appliance"

    assert_text "Appliance was successfully created"
    click_on "Back"
  end

  test "should update Appliance" do
    visit appliance_url(@appliance)
    click_on "Edit this appliance", match: :first

    fill_in "Address", with: @appliance.address
    fill_in "Availability", with: @appliance.availability
    fill_in "Favourite list", with: @appliance.favourite_list_id
    fill_in "Name", with: @appliance.name
    fill_in "Overview", with: @appliance.overview
    fill_in "Photo url", with: @appliance.photo_url
    fill_in "Price", with: @appliance.price
    fill_in "User", with: @appliance.user_id
    click_on "Update Appliance"

    assert_text "Appliance was successfully updated"
    click_on "Back"
  end

  test "should destroy Appliance" do
    visit appliance_url(@appliance)
    click_on "Destroy this appliance", match: :first

    assert_text "Appliance was successfully destroyed"
  end
end
