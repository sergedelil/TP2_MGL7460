require 'Care'

class AssuredCare < Care
  
  attr_accessor :care_num, :percent, :limit, :month_limit
  
  def initialize(care_num, percent, limit, month_limit)
    super(care_num)
    @percent = percent
    @limit = limit
    @month_limit = month_limit
  end
  
  def has_monthly_limit()
    return @month_limit != 0.0
  end
  
  def has_limit()
    return @limit != 0.0
  end
  
  def is_covered()
    return @percent != 0.0
  end
  
end
