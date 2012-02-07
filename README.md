# ComfyCarousel [![Build Status](https://secure.travis-ci.org/comfy/comfy-carousel.png)](http://travis-ci.org/comfy/comfy-carousel) [![Dependency Status](https://gemnasium.com/comfy/comfy-carousel.png)](https://gemnasium.com/comfy/comfy-carousel)

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

You'll notice that carousels have `dimensions` field. You can force-resize uploaded images via ImageMagic values. For example: `300x200#` will resize any image to be 300px wide and 200px in height. Also it will crop image if necessary. 

There's nothing on the front-end really. You have access to `Carousel::Carousel` objects that in turn can be used to access their slides. Like so:

    @carousel = Carousel::Carousel.find_by_identifier('my_carousel')
    @slides = carousel.slides
    
Each slide will have following attributes: `label`, `content`, `url`, `file` (paperclip object), and `position`

---

ComfyCarousel is released under the [MIT license](https://github.com/comfy/comfy-carousel/raw/master/LICENSE)

Copyright 2012 Oleg Khabarov, [The Working Group Inc](http://www.twg.ca)
