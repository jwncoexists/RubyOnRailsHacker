require "test_helper"

class BlogsControllerTest < ActionController::TestCase

  before do
    @blog = blogs(:one)
  end

  def test_index
    get :index
    assert_response :success
    assert_not_nil assigns(:blogs)
  end

  def test_new
    get :new
    assert_response :success
  end

  def test_create
    assert_difference('Blog.count') do
      post :create, blog: {  }
    end

    assert_redirected_to blog_path(assigns(:blog))
  end

  def test_show
    get :show, id: @blog
    assert_response :success
  end

  def test_edit
    get :edit, id: @blog
    assert_response :success
  end

  def test_update
    put :update, id: @blog, blog: {  }
    assert_redirected_to blog_path(assigns(:blog))
  end

  def test_destroy
    assert_difference('Blog.count', -1) do
      delete :destroy, id: @blog
    end

    assert_redirected_to blogs_path
  end
end
