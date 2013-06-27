class CmsAdmin::Carousel::CarouselsController < CmsAdmin::Carousel::BaseController
  
  before_filter :build_carousel,  :only => [:new, :create]
  before_filter :load_carousel,   :only => [:edit, :update, :destroy]
  
  def index
    @carousels = ::Carousel::Carousel.all
  end
  
  def new
    render
  end
  
  def edit
    render
  end
  
  def create
    @carousel.save!
    flash[:success] = 'Carousel created'
    redirect_to new_cms_admin_carousel_carousel_slide_path(@carousel)
  
  rescue ActiveRecord::RecordInvalid
    flash.now[:error] = 'Failed to create Carousel'
    render :action => :new
  end
  
  def update
    @carousel.update_attributes!(params[:carousel])
    flash[:success] = 'Carousel updated'
    redirect_to :action => :edit, :id => @carousel
    
  rescue ActiveRecord::RecordInvalid
    flash.now[:error] = 'Failed to update Carousel'
    render :action => :edit
  end
  
  def destroy
    @carousel.destroy
    flash[:success] = 'Carousel removed'
    redirect_to :action => :index
  end
  
protected
  
  def build_carousel
    @carousel = ::Carousel::Carousel.new(params[:carousel])
  end
  
end