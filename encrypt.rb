require './lib/enigma'

handle = File.open(ARGV[0], "r")

incoming_text = handle.read

handle.close

enigma = Enigma.new

encryption_hash = enigma.encrypt(incoming_text, "02715", "040895")

writer = File.open(ARGV[1], "w")

writer.write(encryption_hash[:encryption])

writer.close

puts "Created '#{ARGV[1]}' with the key #{encryption_hash[:key]} enigma and date #{encryption_hash[:date]}"