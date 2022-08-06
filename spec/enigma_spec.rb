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
    it 'takes in argument(s) and returns a hash' do
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
    xit 'splits up the key to find the shift' do
      enigma.encrypt("hello world", "02715", "040895")

      expected {
        A: 02,
        B: 27,
        C: 71,
        D: 15
      }
      
      expect(enigma.encrypt.build_keys_shift).to eq(expected)
    end
  end 
  
  # describe '#offsets' do
  #     xit 'generates a shift based on the provided date' do
  #       enigma.encrypt("hello world", "02715", "040895")

  #       expected {
  #         A: 1,
  #         B: 0,
  #         C: 2,
  #         D: 5
  #       }

  #       expect(enigma.encrypt.offsets).to eq(expected)
  #     end
  # end

  # describe '#total_shift' do
  #   xit 'returns the total shift based on the keys and offset' do
  #       enigma.encrypt("hello world", "02715", "040895")

  #       expected {
  #         A: 3,
  #         B: 27,
  #         C: 73,
  #         D: 20,
  #       }

  #       expect(enigma.excrypt.total_shift).to eq(expected)
  #   end
  # end
end