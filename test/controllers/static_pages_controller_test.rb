require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
=begin
  def setup
    @base_title = "校缘"
  end

  test "should get home" do
    get :home
    assert_response :success
    assert_select "title", "首页 | #{@base_title}"
  end

  test "should get help" do
    get :help
    assert_response :success
    assert_select "title", "帮助 | #{@base_title}"
  end

  test "should get about" do
    get :about
    assert_response :success
    assert_select "title", "关于 | #{@base_title}"
  end

  test "should get contact" do
    get :contact
    assert_response :success
    assert_select "title", "联系我们 | #{@base_title}"
  end
=end
end
