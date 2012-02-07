class Admin::Carousel::SlidesController < Admin::Carousel::BaseController
  
  before_filter :load_carousel
  before_filter :build_slide, :only => [:new, :create]
  before_filter :load_slide,  :only => [:edit, :update, :destroy]
  
  def index
    @slides = @carousel.slides
  end

  def new
    render
  end

  def edit
    render
  end

  def create
    @slide.save!
    flash[:notice] = 'Slide created'
    redirect_to :action => :index
  rescue ActiveRecord::RecordInvalid
    flash.now[:error] = 'Failed to create Slide'
    render :action => :new
  end

  def update
   @slide.update_attributes!(params[:slide])
    flash[:notice] = 'Slide updated'
    redirect_to :action => :edit
  rescue ActiveRecord::RecordInvalid
    flash.now[:error] = 'Failed to update Slide'
    render :action => :edit
  end

  def destroy
    @slide.destroy
    flash[:notice] = 'Slide deleted'
    redirect_to :action => :index
  end
  
  def reorder
    (params[:carousel_slide] || []).each_with_index do |id, index|
      Carousel::Slide.where(:id => id).update_all(:position => index)
    end
    render :nothing => true
  end

protected

  def build_slide
    # Yes, this is terrible. Thank paperclip for that.
    @slide = Carousel::Slide.new({:carousel => @carousel}.merge(params[:slide] || {}))
  end

  def load_slide
    @slide = @carousel.slides.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:error] = 'Slide not found'
    redirect_to :action => :index
  end
  
end
