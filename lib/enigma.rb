require 'Date'
require './lib/shift_generator'
require './lib/key_generator'
require './lib/date_generator'

class Enigma
  ALPHABET_SET = ('a'..'z').to_a << ' '

  def encrypt(message, key = nil, date = nil)
    key = KeyGenerator.generate_key(key)
    date = DateGenerator.generate_date(date)
    modified_message = message.downcase.split('')
    output_text = ""
    shift_dictionary = ShiftGenerator.build_shift_dictionary(key, date)

    modified_message.each_with_index do |character, index|
      if ALPHABET_SET.include?(character)
        alphabet_position = ALPHABET_SET.index(character)
        shift = ShiftGenerator.assign_shift(index, shift_dictionary)
        new_index = (alphabet_position + shift) % ALPHABET_SET.count
        output_text << ALPHABET_SET[new_index]
      else
        output_text << character
      end
    end
    {
      encryption: output_text,
      key: key,
      date: date
    }
  end

  def decrypt(message, key, date = nil)
    date = DateGenerator.generate_date(date)
    modified_message = message.downcase.split('')
    output_text = ""
    shift_dictionary = ShiftGenerator.build_shift_dictionary(key, date)

    modified_message.each_with_index do |character, index|
      if ALPHABET_SET.include?(character)
        alphabet_position = ALPHABET_SET.index(character)
        shift = ShiftGenerator.assign_shift(index, shift_dictionary)
        new_index = (alphabet_position - shift) % ALPHABET_SET.count
        output_text << ALPHABET_SET[new_index]
      else
        output_text << character
      end
    end
    {
      decryption: output_text,
      key: key,
      date: date
    }
  end
end
