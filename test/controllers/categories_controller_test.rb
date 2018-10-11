require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest

def setup 
   @category = Category.new(name: "sports")
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
    get category_path(@category)
    assert_response :success
  end

end
