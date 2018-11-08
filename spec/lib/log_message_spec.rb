require 'rails_helper'

describe LogMessage do 
  let(:product) { FactoryBot.build_stubbed(:product) }
  let(:log_message) { LogMessage.new product, 0 }

  describe "#product_message" do 
    it "return the correct message" do
      expect($stdout).to receive(:puts)
      allow(log_message).to receive(:standard_message).and_return "message"
      expect(log_message.product_message).to eql "message and property #{product.property.inspect}"
    end
  end
  
  describe "#message" do 
    it "stdout the standard message" do
      expect(STDOUT).to receive(:puts).with("    >>>0 ---- creating #{product.name} with attributes #{product.inspect} and property #{product.property.inspect}") 
      LogMessage.new product, 0
    end
  end
end
