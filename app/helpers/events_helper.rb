module EventsHelper  
  def filter(class_name)
    @events.send(class_name.downcase.to_sym) 
  end

  def th_tag(text)
    content_tag :th, text
  end

  def title(query)
    query.first.is_a? Product ? "Inventory" : query.first.type
  end

  def span(object)
    content_tag :span, object.property.amount, class: 'blue-highlight'
  end
  
  def url_path(method, object)
    url_for(only_path: true, action: method, id: object.id)  
  end
end
