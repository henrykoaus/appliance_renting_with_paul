require "application_system_test_case"

class FavouriteListsTest < ApplicationSystemTestCase
  setup do
    @favourite_list = favourite_lists(:one)
  end

  test "visiting the index" do
    visit favourite_lists_url
    assert_selector "h1", text: "Favourite lists"
  end

  test "should create favourite list" do
    visit favourite_lists_url
    click_on "New favourite list"

    fill_in "Description", with: @favourite_list.description
    fill_in "Name", with: @favourite_list.name
    fill_in "User", with: @favourite_list.user_id
    click_on "Create Favourite list"

    assert_text "Favourite list was successfully created"
    click_on "Back"
  end

  test "should update Favourite list" do
    visit favourite_list_url(@favourite_list)
    click_on "Edit this favourite list", match: :first

    fill_in "Description", with: @favourite_list.description
    fill_in "Name", with: @favourite_list.name
    fill_in "User", with: @favourite_list.user_id
    click_on "Update Favourite list"

    assert_text "Favourite list was successfully updated"
    click_on "Back"
  end

  test "should destroy Favourite list" do
    visit favourite_list_url(@favourite_list)
    click_on "Destroy this favourite list", match: :first

    assert_text "Favourite list was successfully destroyed"
  end
end
