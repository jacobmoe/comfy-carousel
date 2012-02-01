class CreateComfyCarousel < ActiveRecord::Migration
  
  def self.up
    create_table :carousel_slides do |t|
      
      t.timestamps
    end
    
  end
  
  def self.down
    drop_table :carousel_slides
  end
end
