class Carousel::Slide < ActiveRecord::Base
  
  self.table_name = :carousel_slides
  
  # -- Relationships --------------------------------------------------------
  belongs_to :carousel
  
end
