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
  
  describe 'date_generator' do
    it 'generates the date of submission if no date is provided' do

      expect(enigma.date_generator(nil).size).to eq(6)
      expect(enigma.date_generator(nil)).to eq(Date.today.strftime ("%m%d%y"))
    end
  end
end