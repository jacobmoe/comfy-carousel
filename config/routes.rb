Rails.application.routes.draw do
  
  
  ComfortableMexicanSofa::Routing.admin(:path => '/admin')
  
  # Make sure this routeset is defined last
  ComfortableMexicanSofa::Routing.content(:path => '/', :sitemap => false)
  namespace :admin, :path => ComfyCarousel.config.admin_route_prefix do
    namespace :carousel do
      resources :carousels, :except => [:show] do
        resources :slides, :except => [:show] do
          put :reorder, :on => :collection
        end
      end
    end
  end unless ComfyCarousel.config.admin_route_prefix.blank?
  
end
