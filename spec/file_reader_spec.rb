require './spec_helper'
require './file_reader'

RSpec.describe FileReader do

  describe '.read_encryption_file' do
    it 'returns encryption_hash' do
    
      expected = {
        encryption: "keder ohulw",
        key: "02715",
        date: "040895"
      }
      
      expect(FileReader.encrypt_file("message.txt", "encrypted.txt")).to eq(expected)
    end
  end

  describe '.read_decryption_file' do
    it 'returns decryption_hash' do
    
      expected = {
        decryption: "hello world",
        key: "02715",
        date: "040895"
      }
      
      expect(FileReader.decrypt_file("encrypted.txt", "decrypted.txt", "02715", "040895")).to eq(expected)
    end
  end
end