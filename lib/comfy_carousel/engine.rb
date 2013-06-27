require 'comfy_carousel'
require 'rails'

module ComfyCarousel
  class Engine < Rails::Engine
    initializer 'comfy_carousel.configuration' do |app|
      if defined?(ComfortableMexicanSofa)
        # Applying configuraion
        ComfyCarousel.configure do |conf|
          conf.admin_controller   = 'CmsAdmin::BaseController'
          conf.form_builder       = 'ComfortableMexicanSofa::FormBuilder'
          conf.upload_options     = ComfortableMexicanSofa.config.upload_file_options
        end
        # Adding view hooks
        ComfortableMexicanSofa::ViewHooks.add(:navigation, '/admin/carousel/navigation')
      end
    end
  end
end