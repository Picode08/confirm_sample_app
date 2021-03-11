require 'test_helper'

class EverychecksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @everycheck = everychecks(:one)
  end

  test "should get index" do
    get everychecks_url
    assert_response :success
  end

  test "should get new" do
    get new_everycheck_url
    assert_response :success
  end

  test "should create everycheck" do
    assert_difference('Everycheck.count') do
      post everychecks_url, params: { everycheck: { calorie: @everycheck.calorie, eat_date: @everycheck.eat_date, eat_time: @everycheck.eat_time, foodname: @everycheck.foodname } }
    end

    assert_redirected_to everycheck_url(Everycheck.last)
  end

  test "should show everycheck" do
    get everycheck_url(@everycheck)
    assert_response :success
  end

  test "should get edit" do
    get edit_everycheck_url(@everycheck)
    assert_response :success
  end

  test "should update everycheck" do
    patch everycheck_url(@everycheck), params: { everycheck: { calorie: @everycheck.calorie, eat_date: @everycheck.eat_date, eat_time: @everycheck.eat_time, foodname: @everycheck.foodname } }
    assert_redirected_to everycheck_url(@everycheck)
  end

  test "should destroy everycheck" do
    assert_difference('Everycheck.count', -1) do
      delete everycheck_url(@everycheck)
    end

    assert_redirected_to everychecks_url
  end
end
