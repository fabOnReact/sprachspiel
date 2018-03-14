class Array
   def calculation(code, addend)
      [self, addend].transpose.map do |a, b|
         code.call(a, b)
      end
   end

   def compare(code, comparator)
      [self, comparator].transpose.each do |a, b|
         return false unless code.call(a, b) 
      end
      return true
   end
end