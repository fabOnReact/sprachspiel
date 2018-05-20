module EventsHelper
  def filter(class_name)
    @events.send(class_name.downcase.to_sym) 
  end
end
