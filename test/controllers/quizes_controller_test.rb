require 'test_helper'

class QuizesControllerTest < ActionController::TestCase
  test "should get one" do
    get :one
    assert_response :success
  end

end
