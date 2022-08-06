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
        new_index = (alphabet_set + total_shift) % alphabet_set.count
      
      end
    end
  end

  def build_keys_shift
end
