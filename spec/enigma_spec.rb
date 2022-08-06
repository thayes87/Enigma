require './spec_helper'
require './enigma'

RSpec.describe Enigma do 
  let(:enigma) { Enigma.new }
  describe '#initialize' do
    it 'instantiates with state' do

      expect(enigma).to be_instance_of(Enigma)
    end

  describe '#encrypt' do
    it 'takes in argument(s) and returns a hash' do
    enigma.encrypt("hello world", "02715", "040895")
    
    expected {
          encryption: "keder ohulw",
          key: "02715",
          date: "040895"
        }

      expect(enigma.encrypt("hello world", "02715", "040895")).to be_a(Hash)
      expect(enigma.encrypt("hello world", "02715", "040895")).to eq(expected)  
    end
  end
end
