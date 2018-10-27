require "./treatment.rb"
 
if ARGV.length != 3
  puts "argument missing"
  exit
end

claim = Treatment.treat_claim(ARGV[0], ARGV[1])
Treatment.write_output(claim, ARGV[2])