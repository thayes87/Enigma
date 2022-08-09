class KeyGenerator

  def self.generate_key(key)
    if key.nil?
      number_set = Array('1'..'9')
      Array.new(5) { number_set.sample }.join
    elsif key.length < 5
      key.rjust(5, "0")
    elsif key.length > 5
      key.split('').first(5).join
    else
      key
    end
  end
end
