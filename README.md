# ComfyCarousel

This is a small engine that allows you to manage slideshows.

## Installation

Add gem definition to your Gemfile:

    gem 'comfy_carousel'
    
Then from the Rails project's root run:
    
    bundle install
    rails g comfy:carousel
    rake db:migrate
    
You should be able to access `/admin/carousel/carousels` where you can add carousels and their slides.

This gem comes bundled with [slides.jquery.js](http://slidesjs.com/) that you can use via asset pipeline by adding this line to your `app/assets/javascripts/application.js`:

    //= require slides.jquery
    
## Usage

There's nothing on the front-end really. You have access to `Carousel::Carousel` objects that in turn can be used to access their slides. Like so:

    @carousel = Carousel::Carousel.find_by_identifier('my_carousel')
    @slides = carousel.slides
    
Each slide will have following attributes: `label`, `content`, `url`, `file` (paperclip object), and `position`

---

ComfyCarousel is released under the [MIT license](https://github.com/comfy/comfy-blog/raw/master/LICENSE) 
Copyright 2012 Oleg Khabarov, [The Working Group Inc](http://www.twg.ca)