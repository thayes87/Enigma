require './spec_helper'
require './enigma'

RSpec.describe Enigma do 
  let(:enigma) { Enigma.new }
  describe '#initialize' do
    it 'instantiates with state' do

      expect(enigma).to be_instance_of(Enigma)
    end
  end 
  describe '#encrypt' do
    xit 'takes in argument(s) and returns a hash' do
    enigma.encrypt("hello world", "02715", "040895")
    
    expected ({
          encryption: "keder ohulw",
          key: "02715",
          date: "040895"
        })

      expect(enigma.encrypt("hello world", "02715", "040895")).to be_a(Hash)
      expect(enigma.encrypt("hello world", "02715", "040895")).to eq(expected)  
    end
  end

  describe '#keys' do
    it 'splits up the key to find the shift' do
      enigma.encrypt("hello world", "02715", "040895")

      expected = ({
        A: 02,
        B: 27,
        C: 71,
        D: 15
      })
      
      expect(enigma.build_keys_shift("02715")).to eq(expected)
    end
  end 
  
  describe '#build_offset_shift' do
    it 'generates a shift based on the provided date' do
      enigma.encrypt("hello world", "02715", "040895")

        expected = ({
          A: 1,
          B: 0,
          C: 2,
          D: 5
        })

      expect(enigma.build_offset_shift("040895")).to eq(expected)
    end
  end

  describe '#total_shift' do
    it 'returns the total shift based on the keys and offset' do
      enigma.encrypt("hello world", "02715", "040895")

        expected = ({
          A: 3,
          B: 27,
          C: 73,
          D: 20,
        })

      expect(enigma.total_shift("02715", "040895")).to eq(expected)
        require 'pry'; binding.pry
    end
  end
end