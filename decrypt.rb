require './lib/enigma'

handle = File.open(ARGV[0], "r")

incoming_text = handle.read

handle.close

enigma = Enigma.new

decryption_hash = enigma.decrypt(incoming_text, ARGV[2], ARGV[3])

writer = File.open(ARGV[1], "w")

writer.write(decryption_hash[:decryption])

writer.close

puts "Created '#{ARGV[1]}' with the key #{decryption_hash[:key]} and date #{decryption_hash[:date]}"