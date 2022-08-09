require './enigma'
class FileReader
  class << self
    def encrypt_file(input_file, output_file)
      incoming_text = read_file(input_file)
      enigma = Enigma.new

      encryption_hash = enigma.encrypt(incoming_text, "02715", "040895") #=> leaving in for testing purposes

      write_file(output_file, encryption_hash)

      encryption_hash
    end

    def decrypt_file(input_file, output_file, key, date)
      incoming_text = read_file(input_file)
      enigma = Enigma.new

      decryption_hash = enigma.decrypt(incoming_text, key, date)

      write_file(output_file, decryption_hash)

      decryption_hash
    end

    private

    def read_file(input_file)
      handle = File.open(input_file, 'r')
      incoming_text = handle.read
      handle.close
      incoming_text
    end

    def write_file(output_file, encryption_hash)
      writer = File.open(output_file, 'w')
      writer.write(encryption_hash[:encryption])
      writer.close
    end
  end
end
