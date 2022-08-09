require './spec_helper'
require './date_generator'

RSpec.describe DateGenerator do
  describe '.generate_date' do
    it 'generates the date of submission if no date is provided' do

      expect(described_class.generate_date(nil).size).to eq(6)
      expect(described_class.generate_date(nil)).to eq(Date.today.strftime("%m%d%y"))
    end

    it 'can identify and return a valid date' do

      expect(described_class.generate_date("100687")).to eq("100687")
    end
  end
end
