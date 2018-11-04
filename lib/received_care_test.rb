# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

$:.unshift File.join(File.dirname(__FILE__),'..','lib')

require 'test/unit'
require 'received_care'

class Received_care_test < Test::Unit::TestCase
  def test_validate_care_date_equals_true
    assert_equal(true, ReceivedCare.new(1, '2018-10-01', 10).validate_care_date())   
  end
  
  def test_validate_care_date_equals_false
    assert_equal(false, ReceivedCare.new(1, '2018-15-01', 10).validate_care_date())   
  end
  
  def test_validate_amount_equals_false
    assert_equal(false, ReceivedCare.new(1, '2018-10-01', 2.to_s).validate_amount())   
  end
  
end
