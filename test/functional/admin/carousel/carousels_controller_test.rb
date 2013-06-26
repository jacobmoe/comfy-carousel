require File.expand_path('../../../test_helper', File.dirname(__FILE__))

class Admin::Carousel::CarouselsControllerTest < ActionController::TestCase
  
  def test_get_index
    get :index
    assert_response :success
    assert_template :index
    assert assigns(:carousels)
  end
  
  def test_get_new
    get :new
    assert_response :success
    assert_template :new
    assert_select "form[action='/admin/carousel/carousels']"
  end
  
  def test_get_edit
    carousel = carousel_carousels(:default)
    get :edit, :id => carousel
    assert_response :success
    assert_template :edit
    assert_select "form[action='/admin/carousel/carousels/#{carousel.id}']"
  end
  
  def test_get_edit_failure
    get :edit, :id => 'invalid'
    assert_response :redirect
    assert_redirected_to :action => :index
    assert_equal 'Carousel not found', flash[:error]
  end
  
  def test_creation
    assert_difference 'Carousel::Carousel.count' do
      post :create, :carousel => {
        :label      => 'Test',
        :identifier => 'test'
      }
      assert_response :redirect
      assert_redirected_to new_admin_carousel_carousel_slide_path(assigns(:carousel))
      assert_equal 'Carousel created', flash[:success]
    end
  end
  
  def test_creation_failure
    assert_no_difference 'Carousel::Carousel.count' do
      post :create, :carousel => { }
      assert_response :success
      assert_template :new
      assert_equal 'Failed to create Carousel', flash[:error]
    end
  end
  
  def test_update
    carousel = carousel_carousels(:default)
    
    put :update, :id => carousel, :carousel => {
      :label => 'Updated'
    }
    assert_response :redirect
    assert_redirected_to :action => :edit, :id => carousel
    assert_equal 'Carousel updated', flash[:success]
    
    carousel.reload
    assert_equal 'Updated', carousel.label
  end
  
  def test_update_failure
    carousel = carousel_carousels(:default)
    
    put :update, :id => carousel, :carousel => {
      :identifier => ''
    }
    assert_response :success
    assert_template :edit
    assert_equal 'Failed to update Carousel', flash[:error]
    
    carousel.reload
    assert_not_equal '', carousel.identifier
  end
  
  def test_destroy
    assert_difference 'Carousel::Carousel.count', -1 do
      delete :destroy, :id => carousel_carousels(:default)
      assert_response :redirect
      assert_redirected_to :action => :index
      assert_equal 'Carousel removed', flash[:success]
    end
  end
  
end