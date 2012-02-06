class Carousel::Carousel < ActiveRecord::Base
  
  self.table_name = :carousel_carousels
  
  # -- Relationships --------------------------------------------------------
  has_many :slides,
    :dependent => :destroy
    
  # -- Validations ----------------------------------------------------------
  validates :label,
    :presence => true
  validates :identifier,
    :presence => true,
    :format   => { :with => /^\w[a-z0-9_-]*$/i }
    
  # -- Callbacks ------------------------------------------------------------
  before_validation :assign_label
  
protected
  
  def assign_label
    self.label = self.label.blank?? self.identifier.try(:titleize) : self.label
  end
  
end
