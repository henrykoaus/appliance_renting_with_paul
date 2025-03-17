require "test_helper"

class FavouriteListsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @favourite_list = favourite_lists(:one)
  end

  test "should get index" do
    get favourite_lists_url
    assert_response :success
  end

  test "should get new" do
    get new_favourite_list_url
    assert_response :success
  end

  test "should create favourite_list" do
    assert_difference("FavouriteList.count") do
      post favourite_lists_url, params: { favourite_list: { description: @favourite_list.description, name: @favourite_list.name, user_id: @favourite_list.user_id } }
    end

    assert_redirected_to favourite_list_url(FavouriteList.last)
  end

  test "should show favourite_list" do
    get favourite_list_url(@favourite_list)
    assert_response :success
  end

  test "should get edit" do
    get edit_favourite_list_url(@favourite_list)
    assert_response :success
  end

  test "should update favourite_list" do
    patch favourite_list_url(@favourite_list), params: { favourite_list: { description: @favourite_list.description, name: @favourite_list.name, user_id: @favourite_list.user_id } }
    assert_redirected_to favourite_list_url(@favourite_list)
  end

  test "should destroy favourite_list" do
    assert_difference("FavouriteList.count", -1) do
      delete favourite_list_url(@favourite_list)
    end

    assert_redirected_to favourite_lists_url
  end
end
