require 'test_helper'

class StoreTreesControllerTest < ActionController::TestCase
  setup do
    @store_tree = store_trees(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:store_trees)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create store_tree" do
    assert_difference('StoreTree.count') do
      post :create, store_tree: { page_title: @store_tree.page_title }
    end

    assert_redirected_to store_tree_path(assigns(:store_tree))
  end

  test "should show store_tree" do
    get :show, id: @store_tree
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @store_tree
    assert_response :success
  end

  test "should update store_tree" do
    patch :update, id: @store_tree, store_tree: { page_title: @store_tree.page_title }
    assert_redirected_to store_tree_path(assigns(:store_tree))
  end

  test "should destroy store_tree" do
    assert_difference('StoreTree.count', -1) do
      delete :destroy, id: @store_tree
    end

    assert_redirected_to store_trees_path
  end
end
