#require 'JSONHash'
#require 'treatment'
#include Treatment
require "./treatment.rb"


#require 'json'
#bar = JSON['{"a":1,"b":[2,3]}']
#bar['c'] = 'more data'
#bar['b'].concat([4])
#
#puts JSON[bar]
#exit

# >> {"a":1,"b":[2,3],"c":"more data"}
 
if ARGV.length != 2
  puts "argument missing"
  exit
end

puts ARGV[0]
puts ARGV[1]

Treatment.treat_claim(ARGV[0], ARGV[1])

#s = "23.36$"
#montant = s[0..s.length - 1]
#montant = "23.36$"require "./treatment.rb"

#puts montant
#
#puts montant.split(".").map(&:to_i).first
#puts montant.split(".").map(&:to_i).last
#exit



# Test push Git   a suprimer
# ==================   a suprimer
#puts ARGV[0]
#file = JSONHash.new(ARGV[0])
#file_obj = file.load
#
##police = JSONHash.new(ARGV[1])
##police_obj = police.load
#
#puts file_obj["dossier"]
#puts file_obj["mois"]
#reclamations = file_obj["reclamations"]
#
#puts "-------------------"
#reclamations.each { |rec|
#
#  puts rec["soin"]
#  puts rec["date"]
#  puts rec["montant"]
#  
#  puts "-------------------"
#}

#puts reclamations.class
#puts reclamations.length


#pattern.match?(string) if string match
#session.key?("user") if key exist






