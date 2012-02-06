require File.expand_path('../test_helper', File.dirname(__FILE__))

class CarouselTest < ActiveSupport::TestCase
  
  def test_fixtures_validity
    Carousel::Carousel.all.each do |carousel|
      assert carousel.valid?, carousel.errors.inspect 
    end
  end
  
  def test_validations
    carousel = Carousel::Carousel.new
    assert carousel.invalid?
    assert_has_errors_on carousel, [:label, :identifier]
  end
  
  def test_creation
    assert_difference 'Carousel::Carousel.count' do
      carousel = Carousel::Carousel.create(:identifier => 'test')
      assert_equal 'Test', carousel.label
    end
  end
  
  def test_destruction
    assert_difference ['Carousel::Carousel.count', 'Carousel::Slide.count'], -1 do
      carousel_carousels(:default).destroy
    end
  end
  
end