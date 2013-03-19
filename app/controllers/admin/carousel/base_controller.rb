class Admin::Carousel::BaseController < ComfyCarousel.config.admin_controller.to_s.constantize
  
  def load_carousel
    @carousel = ::Carousel::Carousel.find(params[:carousel_id] || params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:error] = 'Carousel not found'
    redirect_to admin_carousel_carousels_path
  end
  
end