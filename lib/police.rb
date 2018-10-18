# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class Police
  attr_accessor :contract, :care_list
  
  def initialize(contract, care_list)
    @contract = contract
    @care_list = care_list
  end
  
end
