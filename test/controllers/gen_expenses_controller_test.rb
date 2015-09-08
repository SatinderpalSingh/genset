require 'test_helper'

class GenExpensesControllerTest < ActionController::TestCase
  setup do
    @gen_expense = gen_expenses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gen_expenses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gen_expense" do
    assert_difference('GenExpense.count') do
      post :create, gen_expense: { batteryStatus: @gen_expense.batteryStatus, client_detail_id: @gen_expense.client_detail_id, date: @gen_expense.date, dieselCharge: @gen_expense.dieselCharge, otherExpenses: @gen_expense.otherExpenses, radiatorStatus: @gen_expense.radiatorStatus, reading: @gen_expense.reading, readingBy: @gen_expense.readingBy }
    end

    assert_redirected_to gen_expense_path(assigns(:gen_expense))
  end

  test "should show gen_expense" do
    get :show, id: @gen_expense
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @gen_expense
    assert_response :success
  end

  test "should update gen_expense" do
    patch :update, id: @gen_expense, gen_expense: { batteryStatus: @gen_expense.batteryStatus, client_detail_id: @gen_expense.client_detail_id, date: @gen_expense.date, dieselCharge: @gen_expense.dieselCharge, otherExpenses: @gen_expense.otherExpenses, radiatorStatus: @gen_expense.radiatorStatus, reading: @gen_expense.reading, readingBy: @gen_expense.readingBy }
    assert_redirected_to gen_expense_path(assigns(:gen_expense))
  end

  test "should destroy gen_expense" do
    assert_difference('GenExpense.count', -1) do
      delete :destroy, id: @gen_expense
    end

    assert_redirected_to gen_expenses_path
  end
end
