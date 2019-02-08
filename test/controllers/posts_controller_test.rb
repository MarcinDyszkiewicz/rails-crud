require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts(:one)
  end

  test "should get index" do
    get posts_path
    assert_response :success
    assert_not_nil assigns(:posts)
  end

  test "should get published posts" do
    get published_posts_path
    assert_response :success
    assert_not_nil assigns(:posts)
  end

  test "should get new" do
    get new_post_path
    assert_response :success
    assert_not_nil assigns(:post)
  end

  test "should create post" do
    assert_difference('Post.count') do
    post posts_path, params: { post: { author: "author name", title: "some tile" } }
    end
    assert_redirected_to posts_path
    assert_equal 'Record added!', flash[:notice]
  end

  test "should get edit" do
    get edit_post_path(@post)
    assert_response :success
  end

  test "should get show" do
    get post_path(@post)
    assert_response :success
  end

  test "should update post" do
    patch post_path(@post), params: { post: { title: "updated" } }
    assert_redirected_to posts_path
    assert_equal 'Record updated!', flash[:notice]
  end

  test "should publish post" do
    post publish_post_path(@post)
    assert_redirected_to posts_path
    assert_equal 'Record updated!', flash[:notice]
  end

  test "should delete post" do
    assert_difference('Post.count', -1) do
    delete post_path(@post)
    assert_redirected_to posts_path
    assert_equal 'Record deleted!', flash[:notice]
    end
  end

end
