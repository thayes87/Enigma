require './shift_generator'
require './enigma'

RSpec.describe ShiftGenerator do
  let(:enigma) { Enigma.new }
  describe '.build_keys_shift' do
    it 'generates a hash to assign shift' do    
          
      expected = {
        A: 02,
        B: 27,
        C: 71,
        D: 15
      }
      
      expect(enigma.build_keys_shift("02715")).to be_a (Hash)
      expect(enigma.build_keys_shift("02715")).to eq(expected)
    end
  end

  describe 'build_offset_shift' do
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

  describe '#build_shift_dictionary' do
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
end