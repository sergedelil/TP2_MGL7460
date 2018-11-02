# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

$:.unshift File.join(File.dirname(__FILE__),'..','lib')
puts __FILE__

require 'test/unit'
require_relative "dollar"

class DollarTest < Test::Unit::TestCase
  def test_convert_to_string_with_symbole_dollar      
    assert_equal('10.10$', Dollar.new(10, 10).to_string())   
  end
  
  def test_get_dollars      
    assert_equal(10, Dollar.new(10, 10).get_dollars())   
  end
end
