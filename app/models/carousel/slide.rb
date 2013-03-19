class Carousel::Slide < ActiveRecord::Base
  
  IMAGE_MIMETYPES = %w(gif jpeg pjpeg png svg+xml tiff).collect{|subtype| "image/#{subtype}"}
  
  self.table_name = :carousel_slides
  
  upload_options = (ComfyCarousel.config.upload_options || {}).merge(
    :styles => lambda { |slide|
      if (c = slide.instance.carousel) && c.dimensions.present?
        { :original => c.dimensions }
      else
        { }
      end
    }
  )
  has_attached_file :file, upload_options
  before_post_process :is_image?

  attr_accessible :carousel, :label, :file, :content, :url
  
  # -- Relationships --------------------------------------------------------
  belongs_to :carousel
  
  # -- Callbacks ------------------------------------------------------------
  before_create :assign_position
  
  # -- Validations ----------------------------------------------------------
  validates :carousel_id, :label,
    :presence => true
    
  # -- Scopes ---------------------------------------------------------------
  default_scope order('carousel_slides.position')
  
  # -- Instance Methods -----------------------------------------------------
  def is_image?
    IMAGE_MIMETYPES.include?(file_content_type)
  end
  
protected
  
  def assign_position
    max = carousel.slides.maximum(:position)
    self.position = max ? max + 1 : 0
  end
  
end
