require File.expand_path('../test_helper', File.dirname(__FILE__))

class SlideTest < ActiveSupport::TestCase
  
  def test_fixtures_validity
    Carousel::Slide.all.each do |slide|
      assert slide.valid?, slide.errors.inspect
    end
  end
  
  def test_validations
    slide = Carousel::Slide.new
    assert slide.invalid?
    assert_has_errors_on slide, [:carousel_id, :label]
  end
  
  def test_creation
    carousel = carousel_carousels(:default)
    assert_difference 'Carousel::Slide.count' do
      slide = carousel.slides.create(
        :label    => 'Test',
        :content  => 'Test Content',
        :url      => 'http://google.com',
        :file     => fixture_file_upload('files/image.jpg', 'image/jpeg')
      )
      assert_equal 1, slide.position
      assert_equal carousel, slide.carousel
    end
  end
  
  def test_is_image?
    slide = carousel_slides(:default)
    assert slide.is_image?
    
    slide.update_attribute(:file_content_type, 'application/pdf')
    assert !slide.is_image?
  end
  
end