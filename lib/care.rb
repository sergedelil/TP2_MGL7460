# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class Care
  attr_accessor :care_num
 	 
  def initialize(care_num)
    @care_num = care_num
  end
  
  def validate_num_care()
    return !!(/^(0|150|175|[1-7]0{2}|3[0-9]{2})$/ =~ @care_num.to_s)
  end
end
