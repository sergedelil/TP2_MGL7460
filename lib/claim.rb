# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class Claim
  
  attr_accessor :account_num, :claim_month, :claim_list

  def initialize(account_num, claim_month, claim_list)
    @account_num = account_num
    @claim_month = claim_month
    @claim_list = claim_list
  end
  
  def validate_account_num()
    return "^[ABCDE]\\d{6}$".match?(@account_num)
  end
  
  def validate_claim_month()
    return "\\d{4}-(0[1-9]|1[0-2])".match?(@claim_month)
  end
  
  def validate_claims()
    #si tous les soins sont de la date de le reclamation.
    #et que les polices des soins correspondent bien au dossier
  end
   
end
