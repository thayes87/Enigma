require './spec_helper'
require './enigma'

RSpec.describe Enigma do 
  let(:enigma) { Enigma.new }

  describe '#initialize' do
    it 'instantiates' do

      expect(enigma).to be_instance_of(Enigma)
    end
  end

  describe '#encrypt' do
    it 'takes in argument(s) and returns a hash' do

      expected = {
        encryption: "keder ohulw",
        key: "02715",
        date: "040895"
      }

      expect(enigma.encrypt("hello world", "02715", "040895")).to be_a(Hash)
      expect(enigma.encrypt("hello world", "02715", "040895")).to eq(expected)
    end

    it 'can account for non-alphabetic characters in a message' do

      expected = {
        encryption: "keder ohulw!",
        key: "02715",
        date: "040895"
      }

      expect(enigma.encrypt("hello world!", "02715", "040895")).to eq(expected)
    end
  end

  describe '#decrypt' do
    it 'takes in argument(s) and returns a hash' do

      expected = {
        decryption: "hello world",
        key: "02715",
        date: "040895"
      }

      expect(enigma.decrypt("keder ohulw", "02715", "040895")).to be_a(Hash)
      expect(enigma.decrypt("keder ohulw", "02715", "040895")).to eq(expected)
    end

    it 'can account for non-alphabetic charaters' do

      expected = {
        decryption: "hello world!",
        key: "02715",
        date: "040895"
      }

      expect(enigma.decrypt("keder ohulw!", "02715", "040895")).to eq(expected)
    end
  end
end
