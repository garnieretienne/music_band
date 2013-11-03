require 'test_helper'

class PagesControllerTest < ActionController::TestCase

  test "should display the first publication on the welcome page" do
    get :welcome
    assert_response :success
    assert_equal Publication.first.id, assigns(:publication).id
  end
end
