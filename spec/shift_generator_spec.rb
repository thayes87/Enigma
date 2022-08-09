require './spec_helper'
require './shift_generator'

RSpec.describe ShiftGenerator do
  describe '.build_shift_dictionary' do
    it 'returns the total shift based on the keys and offset' do

      expected = {
          A: 3,
          B: 27,
          C: 73,
          D: 20
      }

      expect(described_class.build_shift_dictionary("02715", "040895")).to eq(expected)
    end
  end

  describe '#assign_shift' do
    it 'identifies the shift based on the index postion' do

      shift_dictionary = {
        A: 3,
        B: 27,
        C: 73,
        D: 20
      }
    
      expect(described_class.assign_shift(0, shift_dictionary)).to eq(3)
      expect(described_class.assign_shift(1, shift_dictionary)).to eq(27)
      expect(described_class.assign_shift(2, shift_dictionary)).to eq(73)
      expect(described_class.assign_shift(3, shift_dictionary)).to eq(20)
      expect(described_class.assign_shift(4, shift_dictionary)).to eq(3)
      expect(described_class.assign_shift(5, shift_dictionary)).to eq(27)
      expect(described_class.assign_shift(6, shift_dictionary)).to eq(73)
      expect(described_class.assign_shift(7, shift_dictionary)).to eq(20)
    end
  end
end
