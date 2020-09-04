require 'test_helper'

class CreateCategoryTest < ActionDispatch::IntegrationTest

  setup do
      @category = Category.create(name:"Sports")
      @admin=User.create(username:"elton",email:"elton@gmail.com",password:"123",admin:true)
  end


  test "get new category form and create category" do

    sign_in_as(@admin)

    get new_category_path
    assert_response:success
    assert_difference 'Category.count',1 do

      post categories_path , params:{ category:{name:"Life"} }
      assert_response:redirect

    end

    follow_redirect!
    assert_response:success
    assert_match "Life" , response.body

  end

  test "get new category form and reject invalid category submission" do
      sign_in_as(@admin)

    get new_category_path
    assert_response:success
    assert_no_difference 'Category.count' do

      post categories_path , params:{ category:{name:" "} }

    end

    assert_match "The following errors prevented the category from being saved!" ,response.body
    assert_select 'div.alert'
    assert_select 'h4.alert-heading'

  end


end
