require File.expand_path('../../../test_helper', File.dirname(__FILE__))

class Admin::Carousel::SlidesControllerTest < ActionController::TestCase
  
  def test_get_index
    get :index, :carousel_id => carousel_carousels(:default)
    assert_response :success
    assert_template :index
    assert assigns(:slides)
  end
  
  def test_get_new
    carousel = carousel_carousels(:default)
    get :new, :carousel_id => carousel
    assert_response :success
    assert_template :new
    assert assigns(:slide)
    assert_select "form[action='/admin/carousel/carousels/#{carousel.id}/slides']"
  end
  
  def test_get_edit
    carousel = carousel_carousels(:default)
    slide = carousel_slides(:default)
    
    get :edit, :carousel_id => carousel, :id => slide
    assert_response :success
    assert_template :edit
    assert assigns(:slide)
    assert_select "form[action='/admin/carousel/carousels/#{carousel.id}/slides/#{slide.id}']"
  end
  
  def test_get_edit_failure
    get :edit, :carousel_id => carousel_carousels(:default), :id => 'invalid'
    assert_response :redirect
    assert_redirected_to :action => :index
    assert_equal 'Slide not found', flash[:error]
  end
  
  def test_creation
    assert_difference 'Carousel::Slide.count' do
      post :create, :carousel_id => carousel_carousels(:default), :slide => {
        :label    => 'Test',
        :url      => 'http://test.test',
        :content  => 'Test Slide'
      }
      assert_response :redirect
      assert_redirected_to :action => :index
      assert_equal 'Slide created', flash[:notice]
      
      slide = Carousel::Slide.last
      assert_equal 'Test', slide.label
    end
  end
  
  def test_creation_failure
    assert_no_difference 'Carousel::Slide.count' do
      post :create, :carousel_id => carousel_carousels(:default), :slide => { }
      assert_response :success
      assert_template :new
      assert_equal 'Failed to create Slide', flash[:error]
    end
  end
  
  def test_update
    carousel = carousel_carousels(:default)
    slide = carousel_slides(:default)
    
    put :update, :carousel_id => carousel, :id => slide, :slide => {
      :label => 'Updated'
    }
    assert_response :redirect
    assert_redirected_to :action => :edit, :id => slide
    assert_equal 'Slide updated', flash[:notice]
    
    slide.reload
    assert_equal 'Updated', slide.label
  end
  
  def test_update_failure
    carousel = carousel_carousels(:default)
    slide = carousel_slides(:default)
    
    put :update, :carousel_id => carousel, :id => slide, :slide => {
      :label => ''
    }
    assert_response :success
    assert_template :edit
    assert_equal 'Failed to update Slide', flash[:error]
    
    slide.reload
    assert_not_equal '', slide.label
  end
  
  def test_destroy
    assert_difference 'Carousel::Slide.count', -1 do
      delete :destroy, :carousel_id => carousel_carousels(:default), :id => carousel_slides(:default)
      assert_response :redirect
      assert_redirected_to :action => :index
      assert_equal 'Slide deleted', flash[:notice]
    end
  end
  
  def test_reorder
    carousel = carousel_carousels(:default)
    slide_one = carousel_slides(:default)
    slide_two = carousel.slides.create!(
      :label => 'test'
    )
    assert_equal 0, slide_one.position
    assert_equal 1, slide_two.position
    
    post :reorder, :carousel_id => carousel, :carousel_slide => [slide_two.id, slide_one.id]
    assert_response :success
    slide_one.reload
    slide_two.reload
    
    assert_equal 1, slide_one.position
    assert_equal 0, slide_two.position
  end

end
