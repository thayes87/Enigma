class Enigma
  def initialize
  end

  def encrypt(message, key = nil, date = nil)
    key = random_number_generator(key)
    date = date_generator(date)
    modified_message = message.downcase.split("")
    encrypt_message = ""
    alphabet_set = ("a".."z").to_a << " " 
    shift_dictionary = build_shift_dictionary(key, date) 
  
    modified_message.each_with_index do |character, index|
      if alphabet_set.include?(character)
        alphabet_position = alphabet_set.index(character)
        shift = assign_shift(index, shift_dictionary)
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
    shift_dictionary = build_shift_dictionary(key, date)
    
    modified_message.each_with_index do |character, index|
      if alphabet_set.include?(character)
        alphabet_position = alphabet_set.index(character)
        shift = assign_shift(index, shift_dictionary)
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
  
  def assign_shift(index, shift_dictionary)
    if (index % 4).zero?
      shift_dictionary[:A]
    elsif ((index- 1) % 4).zero?
      shift_dictionary[:B]
    elsif ((index- 2) % 4).zero?
      shift_dictionary[:C]
    else
      shift_dictionary[:D]
    end
  end

  def build_shift_dictionary(key, date)
    key_shift = build_keys_shift(key)
    offset_shift = build_offset_shift(date)
    total_shift = Array.new
    total_shift << key_shift
    total_shift << offset_shift
    total_shift.reduce do |final_hash, element| 
      final_hash.merge(element) do 
        |key, old_value, new_value| old_value + new_value
      end
    end
  end
  
  #method works, considering turning into array and using each_cons from battlship
  def build_keys_shift(key) 
    key_shift = Hash.new
    key_shift[:A] = key[0, 2].to_i
    key_shift[:B] = key[1, 2].to_i
    key_shift[:C] = key[2, 2].to_i
    key_shift[:D] = key[3, 4].to_i
    key_shift
  end

  def build_offset_shift(date)
    square_total = (date.to_i * date.to_i)
    offset_indexes = square_total.digits.reverse.last(4)
    offset_shift = Hash.new
    offset_shift[:A] = offset_indexes[0]
    offset_shift[:B] = offset_indexes[1]
    offset_shift[:C] = offset_indexes[2]
    offset_shift[:D] = offset_indexes[3]
    offset_shift    
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