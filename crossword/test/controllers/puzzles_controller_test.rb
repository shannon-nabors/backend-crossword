require 'test_helper'

class PuzzlesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get puzzles_index_url
    assert_response :success
  end

  test "should get show" do
    get puzzles_show_url
    assert_response :success
  end

end
