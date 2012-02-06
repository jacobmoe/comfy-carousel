require File.expand_path('../config/application', __FILE__)
require 'rubygems'
require 'rake'

ComfyCarousel::Application.load_tasks

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name        = 'comfy_carousel'
    gem.homepage    = 'http://github.com/comfy/comfy_carousel'
    gem.license     = 'MIT'
    gem.summary     = 'ComfyCarousel is a carousel engine for Rails 3.1+ apps (and ComfortableMexicanSofa)'
    gem.description = ''
    gem.email       = 'oleg@twg.ca'
    gem.authors     = ['Oleg Khabarov', 'The Working Group Inc.']
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end