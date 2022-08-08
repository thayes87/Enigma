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
    
      expected = {
        encryption: "keder ohulw",
        key: "02715",
        date: "040895"
      }

      expect(enigma.encrypt("hello world", "02715", "040895")).to be_a(Hash)
      expect(enigma.encrypt("hello world", "02715", "040895")).to eq(expected)  
    end

    it 'can account for not alphabetic characters in a message' do
      
      expected = {
        encryption: "keder ohulw!",
        key: "02715",
        date: "040895"
      }

      expect(enigma.encrypt("hello world!", "02715", "040895")).to eq(expected)
    end
  end

  describe '#keys' do
    it 'splits up the key to find the shift' do

      expected = {
        A: 02,
        B: 27,
        C: 71,
        D: 15
      }
      
      expect(enigma.build_keys_shift("02715")).to eq(expected)
    end
  end 
  
  describe '#build_offset_shift' do
    it 'generates a shift based on the provided date' do

        expected = {
          A: 1,
          B: 0,
          C: 2,
          D: 5
        }

      expect(enigma.build_offset_shift("040895")).to eq(expected)
    end
  end

  describe '#build_total_shift' do
    it 'returns the total shift based on the keys and offset' do

        expected = {
          A: 3,
          B: 27,
          C: 73,
          D: 20,
        }

      expect(enigma.build_shift_dictionary("02715", "040895")).to eq(expected)
    end
  end

  describe '#assign_shift' do
    it 'identifies the shift based on the index postion' do
      
      shift_dictionary = {
        A: 3,
        B: 27,
        C: 73,
        D: 20,
      }
           
      expect(enigma.assign_shift(0, shift_dictionary)).to eq(3)
      expect(enigma.assign_shift(1, shift_dictionary)).to eq(27)
      expect(enigma.assign_shift(2, shift_dictionary)).to eq(73)
      expect(enigma.assign_shift(3, shift_dictionary)).to eq(20)
      expect(enigma.assign_shift(4, shift_dictionary)).to eq(3)
      expect(enigma.assign_shift(5, shift_dictionary)).to eq(27)
      expect(enigma.assign_shift(6, shift_dictionary)).to eq(73)
      expect(enigma.assign_shift(7, shift_dictionary)).to eq(20)
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

  describe '#random_number_generator' do
    it 'generates a random 5 digit number if none is provided' do

      expect(enigma.random_number_generator(nil)).to be_a(String)
      expect(enigma.random_number_generator(nil).size).to eq(5)
    end

    it 'can handle a key less than 5 digits' do

      expect(enigma.random_number_generator("234").size).to eq(5)
      expect(enigma.random_number_generator("78")).to eq("00078")
    end

    it 'can handle a key greater than 5 digits' do 

      expect(enigma.random_number_generator("1234567").size).to eq(5)
      expect(enigma.random_number_generator("1234567")).to eq("12345")
    end
  end

  describe 'date_generator' do
    it 'generates the date of submission if no date is provided' do

      expect(enigma.date_generator(nil).size).to eq(6)
      expect(enigma.date_generator(nil)).to eq(Date.today.strftime ("%m%d%y"))
    end
  end
end