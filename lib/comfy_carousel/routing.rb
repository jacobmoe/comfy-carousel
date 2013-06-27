module ComfyCarousel::Routing
  
  def self.admin(options = {})
    options[:path] ||= 'cms-admin'
    
    Rails.application.routes.draw do
      namespace :cms_admin, :path => options[:path], :except => :show do
        namespace :carousel do
          resources :carousels, :except => [:show] do
            resources :slides, :except => [:show] do
              put :reorder, :on => :collection
            end
          end
        end
      end
    end
  end

end
