# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require "Creator"

class Treatment
  
  @refund = 0.0
  
  def treat_claim(input_file, police_file)
    
    claim = load_claim(input_file)
    polices = load_police(police_file)
    # calcule du remboursement
 
  end
  
end
