# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require 'JSONHash'
require 'Police'
require 'Claim'
require 'Care'
require './assured_care'
require './received_care'
require 'Message'


module Creator
  
  def self.load_police(police_file)
    _polices = self.get_json_objet(police_file)
    polices = _polices["police"]
    list_assured_care = []
    list_police = []
    polices.each { |police|
      constract = police["contrat"]
      cares = police["soins"]
      cares.each { |care|
        care_num = care["soin"]
        percent = care["pourcentage"]
        limit = care["limite"]
        month_limit = care["limiteMensuelle"]
        list_assured_care.push(AssuredCare.new(care_num, percent, limit, month_limit))
      }
      list_police.push(Police.new(constract, list_assured_care))
    }
    return list_police 
  end
  
  def self.load_claim(input_file)
    claim_obj = self.get_json_objet(input_file)
    account = claim_obj["dossier"]
    month = claim_obj["mois"]
    claims = claim_obj["reclamations"]
    list_claim = []
    
    claims.each { |claim|
      care_num = claim["soin"]
      care_date = claim["date"]
      amount = claim["montant"]
      list_claim.push(ReceivedCare.new(care_num, care_date, amount))
    }
    the_claim = Claim.new(account, month, list_claim)
    validate_claim(the_claim)
    return the_claim
  end
  
  def self.validate_claim(claim)
    if !claim.validate_account_num
      message = "Le numero du dossier n est pas valide"
    elsif !claim.validate_claim_month
      message = "Le mois de la reclamation n est pas valide"
    end
    error_handle(message) if message
    validate_received_claims(claim)
  end
  
  def self.validate_received_claims(claim)
    i = 1
    claim.claim_list.each { |one_claim|
      if ! one_claim.validate_num_care
        message = "Le numero de soin du soin " + i.to_s + " n est pas valide"
      elsif ! (one_claim.validate_care_date and one_claim.care_date[0..6] == claim.claim_month)
        message = "La date du soin " + i.to_s + " n est pas valide"
      elsif ! one_claim.validate_amount
        message = "Le montant du soin " + i.to_s + " n est pas valide" 
      end
      error_handle(message) if message
      i += 1
    }
  end
  
  def self.get_json_objet(file)
    f = JSONHash.new(file)
    return f.load
  end
end
