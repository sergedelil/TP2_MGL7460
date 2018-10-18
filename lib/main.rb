require 'JSONHash'
#require 'Treatment'
 
if ARGV.length != 1
  puts "argument missing"
  exit
end

#treat_claim(ARGV[0], ARGV[1])







# ==================   a suprimer
puts ARGV[0]
file = JSONHash.new(ARGV[0])
file_obj = file.load

#police = JSONHash.new(ARGV[1])
#police_obj = police.load

puts file_obj["dossier"]
puts file_obj["mois"]
reclamations = file_obj["reclamations"]

puts "-------------------"
reclamations.each { |rec|

  puts rec["soin"]
  puts rec["date"]
  puts rec["montant"]
  
  puts "-------------------"
}

#puts reclamations.class
#puts reclamations.length


#pattern.match?(string) if string match
#session.key?("user") if key exist






