require "test_helper"

class OfferListsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get offer_lists_index_url
    assert_response :success
  end
end
