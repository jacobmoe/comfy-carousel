class Carousel::Slide < ActiveRecord::Base
  
  self.table_name = :carousel_slides
  
  has_attached_file :file
  
  # -- Relationships --------------------------------------------------------
  belongs_to :carousel
  
  # -- Validations ----------------------------------------------------------
  validates :carousel_id,
    :presence => true
  
end
