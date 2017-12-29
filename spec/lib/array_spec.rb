require 'rails_helper'

def is_not_higher
   return Proc.new {|x, y| x >= y}
end 

describe Array do 
   describe '#check_items' do
      let(:c) {[1,2,3]}
      it 'should return false if one item does not satisfy the code block' do
         f = [1,2,6]
         expect(c.compare(is_not_higher, f)).to be(false)
      end

      it 'should return true if no item dissatisfy the code block' do
         f = [1, 2, 1]
         expect(c.compare(is_not_higher, f)).to be(true)
      end
   end
end