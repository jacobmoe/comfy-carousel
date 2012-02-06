require 'comfy_carousel'
require 'rails'

module ComfyCarousel
  class Engine < Rails::Engine
    initializer 'comfy_carousel.configuration' do |app|
      if defined?(ComfortableMexicanSofa)
        # Applying configuraion
        ComfyCarousel.configure do |conf|
          conf.admin_route_prefix = ComfortableMexicanSofa.config.admin_route_prefix
          conf.admin_controller   = 'CmsAdmin::BaseController'
          conf.form_builder       = 'ComfortableMexicanSofa::FormBuilder'
        end
        # Adding view hooks
        ComfortableMexicanSofa::ViewHooks.add(:navigation, '/admin/carousel/navigation')
      end
    end
  end
end