require './lib/enigma'
require './lib/file_reader'

# incoming_text = FileReader.read_file
input_file = ARGV[0]
output_file = ARGV[1]
key = ARGV[2]
date = ARGV[3]

decryption_hash = FileReader.decrypt_file(input_file, output_file, key, date)

puts "Created '#{output_file}' with the key #{decryption_hash[:key]} enigma and date #{decryption_hash[:date]}"
