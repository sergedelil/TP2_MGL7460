# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require 'json'


class Claim
  
  attr_accessor :account_num, :claim_month, :claim_list, :total

  def initialize(account_num, claim_month, claim_list, total=0)
    @account_num = account_num
    @claim_month = claim_month
    @claim_list = claim_list
    @total = total
  end
  
  def validate_account_num()
    return !!(/^[ABCDE]\d{6}$/ =~ @account_num )
  end
  
  def validate_claim_month()
    return !!(/^\d{4}-(0[1-9]|1[0-2])$/ =~ @claim_month)
  end
  
  def to_json
    {
      dossier: @account_num,
      mois: @claim_month,
      reclamations: @claim_list.map do |received_care|
        received_care.to_hash
      end,
      total: @total
    }.to_json
  end  
end
