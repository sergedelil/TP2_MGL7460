# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require 'Care'

class AssuredCare < Care
  
  attr_accessor :care_num, :limit, :percent, :month_limit
  
  def initialize(care_num, limit, percent, month_limit)
    super(care_num)
    @limit = limit
    @percent = percent
    @month_limit = month_limit
  end
  
  def have_monthly_limit()
    return @month_limit != 0.0
  end
  
  def have_limit()
    return @limit != 0.0
  end
  
  def is_covered()
    return @percent != 0.0
  end
  
end
