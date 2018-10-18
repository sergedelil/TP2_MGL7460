# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require 'JSONHash', 'Police', 'Claim', 'AssuredCare', 'Care'

module Creator
  
  def load_police(police_file)
    
    polices = get_json_objet(police_file)
    list_assured_care = []
    list_police = []
    
    polices.each { |police|
      constract = police["contrat"]
      cares = police["soins"]
      cares.each { |care|
        care_num = care["soin"]
        limit = care["limite"]
        percent = care["pourcentage"]
        month_limit = care["limiteMensuelle"]
        list_assured_care.push(AsuredCare.new(care_num, limit, percent, month_limit))
      }
      list_police.push(Police.new(constract, list_assured_care))
    }
    return list_police 
  end
  
  def load_claim(input_file)
    
    claim_obj = get_json_objet(input_file)
    account = claim_obj["dossier"]
    month = claim_obj["mois"]
    claims = file_obj["reclamations"]

    list_claim = []
    claims.each { |claim|
      care_num = claim["soin"]
      care_date = claim["date"]
      amount = claim["montant"]
      list_claim.push(ReceivedCare.new(care_num, care_date, amount))
    }
    claim = Claim.new(account, month, list_claim)
    validate_claim(claim)
    return claim
  end
  
  def validate_claim(claim)
    #appeler toutes les methodes de validation de l'objet reclamation.
  end
  
  def get_json_objet(file)
    f = JSONHash.new(file)
    return f.load
  end
end
