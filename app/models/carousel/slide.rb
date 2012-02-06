class Carousel::Slide < ActiveRecord::Base
  
  self.table_name = :carousel_slides
  
  has_attached_file :file
  
  # -- Relationships --------------------------------------------------------
  belongs_to :carousel
  
  # -- Callbacks ------------------------------------------------------------
  before_create :assign_position
  
  # -- Validations ----------------------------------------------------------
  validates :carousel_id, :label,
    :presence => true
    
  # -- Scopes ---------------------------------------------------------------
  default_scope order('carousel_slides.position')
  
protected
  
  def assign_position
    max = carousel.slides.maximum(:position)
    self.position = max ? max + 1 : 0
  end
  
end
