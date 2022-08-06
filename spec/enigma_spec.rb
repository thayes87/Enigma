require 'spec_helper'
require './lib/enigma'

RSpec.describe Enigma do 

  let(:enigma_1) { Enigma.new("hello world", 12345, 040822) }
  
  describe "#initialize" do
    it 'instantiates and has state' do

      expect(enigma_1).to be_instance_of(Enigma)
      expect(enigma_1.encryption).to eq("hello world")
      expect(enigma_1.key).to eq(12345)
      expect(enigma_1.date).to eq(040822)
    end
  end
end