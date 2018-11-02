# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require_relative "Creator"
require_relative "./dollar.rb"



module Treatment
  
  #@refund = Dollar.new
  
  def self.treat_claim(input_file, police_file)
    limit_month_cum = self.create_dollar(0.0)
    claim = Creator.load_claim(input_file)
    polices = Creator.load_police(police_file)
  
    self.calculate_refund(claim, polices, limit_month_cum)
    return claim
  end
  
  def self.calculate_refund(claim, polices, limit_month_cum)
    refund_cumul = self.create_dollar(0.0)
    list_claim = claim.claim_list
    contract = claim.account_num[0]
    list_claim.each { |_claim|
      care = self.get_assured_care(contract, _claim, polices)
      if care.is_covered
        self.apply_police(_claim, care)
        refund_cumul.additionner(@refund)
        # handle_monthly_limit(care, month_limit)
      end
    }
    claim.total = refund_cumul.to_string
    return claim
  end
  
  def handle_monthly_limit(care, month_limit)
    # à completer
    if month_limit.get_total_cents < @refund.get_total_cents
      limit_month_cum.additionner(@refund)
      #if month_limit.get_total_cents > @refund.get_total_cents
        
      #end
    end
  end
  
  def self.write_output(claim, output_path)
    obj = claim.to_json
    out = JSONHash.new(output_path)
    out.save(obj)
    puts JSON.pretty_generate(JSON.parse(obj))
  end
  
  def self.get_assured_care(contract, _claim, polices)
    polices.each { |police|
      if contract == police.contract
        cares = police.care_list
        care_num = _claim.care_num
        cares.each { |care|
          if care_num == care.care_num
            return care
          end
        }
      end 
    } 
  end
  
  def self.apply_police(_claim, care)
    @refund = self.create_dollar(_claim.amount)
    @refund.pourcentage(care.percent * 100)
    
    if care.has_limit
      amount_limit = create_dollar(care.limit)
      if @refund.get_total_cents > amount_limit.get_total_cents
        @refund = amount_limit
      end
    end
    _claim.amount = @refund.to_string
  end
  
  def get_assured_care_list(contract, polices)
    polices.each { |police|
      if police["contrat"] == contract
        return police["soins"]
      end
    }
  end
  
  
  def self.create_dollar(montant)
    if montant != 0.0
      dollars = montant.split(".").map(&:to_i).first
      cents = montant.split(".").map(&:to_i).last
    else
      dollars = 0
      cents = 0
    end
    return Dollar.new(dollars, cents)
    
  end
  
end
