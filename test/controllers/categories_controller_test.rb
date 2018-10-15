require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest

def setup 
   @category = Category.new(name: "sports")
   @user = User.create(name: "john" , email: "john@o2.pl", password: "password", admin: true)
end



  test "should get index" do
    get categories_index_url
    assert_response :success
  end

  test "should get home" do
    get categories_home_url
    assert_response :success
  end

  test "should get new" do
    sing_in_as(@user, "password")
    get category_path(@category)
    assert_response :success
  end

  test "should redirect create when admin not logged in" do
    assert_no_difference 'Category.count' do
      post categories_path, params:{category: {name: "sports"}}
    end
    assert_redirected_to categories_path
  end


end
