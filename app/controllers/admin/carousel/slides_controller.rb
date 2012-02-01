class Admin::Carousel::SlidesController < CmsAdmin::BaseController
  
  before_filter :build_slide, :only => [:new, :create]
  before_filter :load_slide,  :only => [:edit, :update, :destroy]
  
  def index
    @slides = Slide.order('id DESC').page(params[:page])
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

protected

  def build_slide
    @slide = Slide.new(params[:slide])
  end

  def load_slide
    @slide = Slide.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:error] = 'Slide not found'
    redirect_to :action => :index
  end
  
end
