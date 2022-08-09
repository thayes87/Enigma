require 'Date'
require './shift_generator'
require './key_generator'
require './date_generator'

class Enigma
  ALPHABET_SET = ("a".."z").to_a << " "
 
  def encrypt(message, key = nil, date = nil)
    key = KeyGenerator.generate_key(key)
    date = DateGenerator.generate_date(date)
    modified_message = message.downcase.split("")
    encrypt_message = ""
    shift_dictionary = ShiftGenerator.build_shift_dictionary(key, date)
    
    modified_message.each_with_index do |character, index|
      if ALPHABET_SET.include?(character)
        alphabet_position = ALPHABET_SET.index(character)
        shift = ShiftGenerator.assign_shift(index, shift_dictionary)
        new_index = (alphabet_position + shift) % ALPHABET_SET.count
        encrypt_message << ALPHABET_SET[new_index]
      else
        encrypt_message << character 
      end
    end
    {
      encryption: encrypt_message,
      key: key,
      date: date
    }
  end

  def decrypt(message, key, date)
    modified_message = message.downcase.split("")
    decrypt_message = ""
    shift_dictionary = ShiftGenerator.build_shift_dictionary(key, date)
    
    modified_message.each_with_index do |character, index|
      if ALPHABET_SET.include?(character)
        alphabet_position = ALPHABET_SET.index(character)
        shift = ShiftGenerator.assign_shift(index, shift_dictionary)
        new_index = (alphabet_position - shift) % ALPHABET_SET.count
        decrypt_message << ALPHABET_SET[new_index]
      else
        decrypt_message << character
      end
    end
    {
      decryption: decrypt_message,
      key: key,
      date: date
    }
  end 
end