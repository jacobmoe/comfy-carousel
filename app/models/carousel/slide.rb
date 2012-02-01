class Carousel::Slide < ActiveRecord::Base
  
  has_attached_file :slide, 
    :styles => {
                  :slide => "450x315#",
                  :edit_page => "150x150>"
               }
    
  attr_accessible :description,
                  :url,
                  :slide,
                  :title,
                  :sort
                  
  # -- Validations ----------------------------------------------------------
  
  validates :description,
            :url,
            :title,
            :sort,
    :presence => true
  
end
