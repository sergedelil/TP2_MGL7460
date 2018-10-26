require "./treatment.rb"
 


#res = !!("A123455" =~ /^[ABCDE]\d{6}$/)
#res = !!(/^[ABCDE]\d{6}$/ =~ "A123455" )
#puts res
#exit

if ARGV.length != 3
  puts "argument missing"
  exit
end

claim = Treatment.treat_claim(ARGV[0], ARGV[1])
Treatment.write_output(claim, ARGV[2])

# Pour la validation
#pattern.match?(string) if string match
#session.key?("user") if key exist






