require File.expand_path('../test_helper', File.dirname(__FILE__))

class ConfigurationTest < ActiveSupport::TestCase
  
  def test_configuration
    assert config = ComfyCarousel.configuration
    assert_equal 'admin',                       config.admin_route_prefix
    assert_equal 'ApplicationController',       config.admin_controller
    assert_equal 'ComfyCarousel::FormBuilder',  config.form_builder
    assert_equal ({}),                          config.upload_options
  end
  
  def test_initialization_overrides
    ComfyCarousel.config.admin_route_prefix = 'new-admin'
    assert_equal 'new-admin', ComfyCarousel.config.admin_route_prefix
  end
  
end