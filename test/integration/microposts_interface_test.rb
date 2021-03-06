require 'test_helper'

# 微博资源界面的集成测试

class MicropostsInterfaceTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:sunkun)
  end

  test "micropost interface" do
    log_in_as(@user)
    get root_path
    assert_select 'div.pagination'

    # 无效提交
    assert_no_difference 'Micropost.count' do
      post microposts_path, micropost: { content: "" }
    end
    assert_select 'div#error_explanation'

    # 有效提交
    content = "This micropost really ties the room together"
    assert_difference 'Micropost.count', 1 do
      post microposts_path, micropost: { content: content }
    end
    assert_redirected_to root_url
    follow_redirect!
    assert_match content, response.body

    # 删除一条微博
    assert_select 'a', text: '删除'
    first_micropost = @user.microposts.paginate(page: 1).first
    assert_difference 'Micropost.count', -1 do
      delete micropost_path(first_micropost)
    end

    # 访问另一个用户的资料页面
    get user_path(users(:likaifu))
    assert_select 'a', text: '删除', count: 0
 end
end
