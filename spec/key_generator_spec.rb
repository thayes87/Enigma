require './spec_helper'
require './key_generator'

RSpec.describe KeyGenerator do
  describe '.generate_key' do
    it 'generates a random 5 digit number if none is provided' do

      expect(described_class.generate_key(nil)).to be_a(String)
      expect(described_class.generate_key(nil).size).to eq(5)
    end

    it 'can handle a key less than 5 digits' do

      expect(described_class.generate_key("234").size).to eq(5)
      expect(described_class.generate_key("78")).to eq("00078")
    end

    it 'can handle a key greater than 5 digits' do

      expect(described_class.generate_key("1234567").size).to eq(5)
      expect(described_class.generate_key("1234567")).to eq("12345")
    end

    it 'can identify and return a valid key' do

      expect(described_class.generate_key("15979")).to eq("15979")
    end
  end
end
