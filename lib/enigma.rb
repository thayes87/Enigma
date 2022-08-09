require 'Date'
require './shift_generator'

class Enigma
  def initialize
  end

  def encrypt(message, key = nil, date = nil)
    key = random_number_generator(key)
    date = date_generator(date)
    modified_message = message.downcase.split("")
    encrypt_message = ""
    alphabet_set = ("a".."z").to_a << " " 
    shift_dictionary = ShiftGenerator.build_shift_dictionary(key, date)
    
    modified_message.each_with_index do |character, index|
      if alphabet_set.include?(character)
        alphabet_position = alphabet_set.index(character)
        shift = ShiftGenerator.assign_shift(index, shift_dictionary)
        new_index = (alphabet_position + shift) % alphabet_set.count
        encrypt_message << alphabet_set[new_index]
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
    alphabet_set = ("a".."z").to_a << " "
    shift_dictionary = ShiftGenerator.build_shift_dictionary(key, date)
    
    modified_message.each_with_index do |character, index|
      if alphabet_set.include?(character)
        alphabet_position = alphabet_set.index(character)
        shift = ShiftGenerator.assign_shift(index, shift_dictionary)
        new_index = (alphabet_position - shift) % alphabet_set.count
        decrypt_message << alphabet_set[new_index]
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
  
  def random_number_generator(key)
    if key.nil?
      number_set = Array("1".."9")
      Array.new(5) { number_set.sample }.join
    elsif
      key.length < 5
      key.rjust(5, "0")
    elsif
      key.length > 5
      key.split("").first(5).join
    else  
      key
    end
  end

  def date_generator(date)
    if date.nil?
      Date.today.strftime ("%m%d%y")
    else
      date
    end
  end
end