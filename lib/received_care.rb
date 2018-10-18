# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require 'Care'

class ReceivedCare < Care
  
  attr_accessor :care_num, :care_date, :amount
  
  def initialize(care_num, care_date, amount)
    super(care_num)
    @care_date = care_date
    @amount = amount
  end
  
  def validate_care_date()
    return "^[0-9]{4}-(0[1-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$".match?(@care_date)
  end
  
  def validate_amount()
    return "^\\d+[.,]?\\d{2}\\$$"..match?(@amount)
  end
end