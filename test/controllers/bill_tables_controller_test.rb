require 'test_helper'

class BillTablesControllerTest < ActionController::TestCase
  setup do
    @bill_table = bill_tables(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bill_tables)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bill_table" do
    assert_difference('BillTable.count') do
      post :create, bill_table: { bill_id: @bill_table.bill_id, mail_sent: @bill_table.mail_sent, monthly_rent: @bill_table.monthly_rent, owner_payment: @bill_table.owner_payment, third_party_payment: @bill_table.third_party_payment }
    end

    assert_redirected_to bill_table_path(assigns(:bill_table))
  end

  test "should show bill_table" do
    get :show, id: @bill_table
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bill_table
    assert_response :success
  end

  test "should update bill_table" do
    patch :update, id: @bill_table, bill_table: { bill_id: @bill_table.bill_id, mail_sent: @bill_table.mail_sent, monthly_rent: @bill_table.monthly_rent, owner_payment: @bill_table.owner_payment, third_party_payment: @bill_table.third_party_payment }
    assert_redirected_to bill_table_path(assigns(:bill_table))
  end

  test "should destroy bill_table" do
    assert_difference('BillTable.count', -1) do
      delete :destroy, id: @bill_table
    end

    assert_redirected_to bill_tables_path
  end
end
