# Loading engine only if this is not a standalone installation
unless defined? ComfyCarousel::Application
  require File.expand_path('comfy_carousel/engine', File.dirname(__FILE__))
end

[ 'comfy_carousel/configuration',
  'comfy_carousel/form_builder',
  'comfy_carousel/routing'
].each do |path|
  require File.expand_path(path, File.dirname(__FILE__))
end

module ComfyCarousel
  class << self
    
    def configure
      yield configuration
    end
    
    def configuration
      @configuration ||= Configuration.new
    end
    alias :config :configuration
    
  end
end