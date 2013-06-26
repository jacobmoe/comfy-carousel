Rails.application.routes.draw do
  
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