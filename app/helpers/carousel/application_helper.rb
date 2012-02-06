module Carousel::ApplicationHelper
  
  def comfy_form_for(record_or_name_or_array, *args, &proc)
    options = args.extract_options!
    form_for(
      record_or_name_or_array,
      *(args << options.merge(:builder => ComfyCarousel.config.form_builder.to_s.constantize)),
      &proc
    )
  end

end