class LogMessage
  attr_reader :index, :object
  def initialize(object,index) 
    @index = index
    @object = object
    @object.valid? ?  message : error
  end

  def message
    case @object.class.name
      when 'Product' then puts product_message
      else puts standard_message 
    end
  end

  def product_message
    "#{standard_message} and property #{@object.property.inspect}"
  end

  def standard_message
    "    >>>#{@index} ---- creating #{object_name} with attributes #{@object.inspect}"
  end

  def error
    puts "    xxx#{@index} ---- #{@object.class} #{object_name} invalid. Error Messages #{@object.errors.full_messages}" 
  end

  def object_name
    case @object.class.name
    when "Chatroom" then "chatroom"
    when "Message" then "message"
    else @object.name; end
  end
end
