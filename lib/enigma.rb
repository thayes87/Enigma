class Enigma
  def initialize
  end

  def encrypt(message, key, date)
    mod_message = message.downcase
    encrypt_message = ""
    alphabet_set = ("a".."z").to_a << " " 
  

    mod_message.each_char.map do |character|
      if alphabet_set.include?(character)
        alpha_position = alphabet_set.index(character)
        new_index = (alpha_position + total_shift) % alphabet_set.count
      
      end
    end
  end

  def total_shift(key, date)

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
end