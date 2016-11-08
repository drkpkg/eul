require 'test_helper'

class ApiControllerTest < ActionDispatch::IntegrationTest
  test "should get packages" do
    get api_packages_url
    assert_response :success
  end

  test "should get offices" do
    get api_offices_url
    assert_response :success
  end

end
