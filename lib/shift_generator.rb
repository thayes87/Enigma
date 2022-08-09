class ShiftGenerator
  class << self
    def build_shift_dictionary(key, date)
      key_shift = build_keys_shift(key)
      offset_shift = build_offset_shift(date)
      total_shift = Array.new
      total_shift << key_shift
      total_shift << offset_shift
      total_shift.reduce do |final_hash, element|
        final_hash.merge(element) do |_key, old_value, new_value|
          old_value + new_value
        end
      end
    end

    def assign_shift(index, shift_dictionary)
      if (index % 4).zero?
        shift_dictionary[:A]
      elsif ((index - 1) % 4).zero?
        shift_dictionary[:B]
      elsif ((index - 2) % 4).zero?
        shift_dictionary[:C]
      else
        shift_dictionary[:D]
      end
    end

    private

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
end
