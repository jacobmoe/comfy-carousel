class CreateComfyCarousel < ActiveRecord::Migration
  
  def self.up
    create_table :carousel_carousels do |t|
      t.string :label,      :null => false
      t.string :identifier, :null => false
      t.string :dimensions
      t.timestamps
    end
    add_index :carousel_carousels, :identifier
    
    create_table :carousel_slides do |t|
      t.integer :carousel_id, :null => false
      t.string  :label,       :null => false
      t.text    :content
      t.string  :url
      t.string  :file_file_name
      t.string  :file_content_type
      t.integer :file_file_size
      t.integer :position,    :null => false, :default => 0
      t.timestamps
    end
    add_index :carousel_slides, [:carousel_id, :position]
  end
  
  def self.down
    drop_table :carousel_carousels
    drop_table :carousel_slides
  end
end
