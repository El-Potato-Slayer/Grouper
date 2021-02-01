require 'test_helper'

class GroupExpensesControllerTest < ActionDispatch::IntegrationTest
  test 'should get new' do
    get group_expenses_new_url
    assert_response :success
  end

  test 'should get create' do
    get group_expenses_create_url
    assert_response :success
  end

  test 'should get destroy' do
    get group_expenses_destroy_url
    assert_response :success
  end
end
