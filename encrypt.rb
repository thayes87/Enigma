require './lib/enigma'
require './lib/file_reader'

# incoming_text = FileReader.read_file
input_file = ARGV[0]
output_file = ARGV[1]

encryption_hash = FileReader.encrypt_file(input_file, output_file)

puts "Created '#{output_file}' with the key #{encryption_hash[:key]} enigma and date #{encryption_hash[:date]}"
