require 'test_helper'

class Admin::SlidesControllerTest < ActionController::TestCase
  
  def test_get_index
    get :index
    assert_response :success
    assert_template :index
    assert assigns(:slides)
  end
  
  def test_get_new
    get :new
    assert_response :success
    assert_template :new
    assert assigns(:slide)
  end
  
  def test_get_edit
    get :edit, :id => slides(:one)
    assert_response :success
    assert_template :edit
    assert assigns(:slide)
  end
  
  def test_get_edit_failure
    get :edit, :id => 'invalid'
    assert_response :redirect
    assert_redirected_to :action => :index
    assert_equal 'Slide not found', flash[:error]
  end
  
  def test_creation
    assert_difference 'Slide.count' do
      post :create, :slide => {
        :description => "MyText",
        :url => "MyString",
        :title => "MySlideTitle",
        :sort => 1
      }
      assert_response :redirect
      assert_redirected_to :action => :index
      slide = Slide.last
      assert_equal 'MyText', slide.description
    end
  end
  
  def test_creation_failure
    assert_no_difference 'Slide.count' do
      post :create, :slide => { }
      assert_response :success
      assert_template :new
      assert_equal 'Failed to create Slide', flash[:error]
    end
  end
  
  def test_update
    slide = slides(:one)
    put :update, :id => slide, :slide => {
      :description => "MyText",
      :url => "MyString",
      :title => "UpdatedTitle",
      :sort => 1
    }
    assert_response :redirect
    assert_redirected_to :action => :edit
    slide.reload
    assert_equal 'UpdatedTitle', slide.title
  end
  
  def test_update_failure
    slide = slides(:one)
    put :update, :id => slide, :slide => {
      :description => ''
    }
    assert_response :success
    assert_template :edit
    assert_equal 'Failed to update Slide', flash[:error]
    slide.reload
    assert_not_equal '', slide.description
  end
  
  def test_destroy
    assert_difference 'Slide.count', -1 do
      delete :destroy, :id => slides(:one)
      assert_response :redirect
      assert_redirected_to :action => :index
      assert_equal 'Slide deleted', flash[:notice]
    end
  end

end
