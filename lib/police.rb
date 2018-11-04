class Police
  attr_accessor :contract, :care_list
  
  def initialize(contract, care_list)
    @contract = contract
    @care_list = care_list
  end
end
