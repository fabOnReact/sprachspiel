module EventsHelper  
  def filter(class_name)
    @events.send(class_name.downcase.to_sym) 
  end

  def th_tag(text)
    content_tag :th, text
  end
end
