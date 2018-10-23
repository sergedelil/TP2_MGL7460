# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class Dollar
  
  attr_accessor :total_cents
  
  def initialize(dollars, cents)
    if(dollars < 0 || cents < 0 || cents > 99)
      puts "error"
      #throw new IllegalArgumentException()
    else
      @total_cents = dollars * 100 + cents;
    end
  end
  
#  def self.initialize()
#    @total_cents = 0
#  end
  
  def to_string()
    return get_dollars().to_s + "." + get_cents().to_s + "$"
  end
    
  def get_dollars()
    return @total_cents.to_i / 100 
  end

  def get_cents()
    return @total_cents.to_i % 100 
  end

  def get_total_cents()
    return @total_cents
  end

  def additionner (autre)
    @total_cents += autre.total_cents
  end
    
  def soustraire (autre) #throws OperationInvalideException 
    verifierOperandes(autre)
    @total_cents -= autre.total_cents
  end
    
  def pourcentage(taux)
    valeur = @total_cents * taux
    @total_cents = (valeur / 100) + (valeur % 100)
  end
    
  def multiplier (autre)
    @total_cents = @total_cents * autre.total_cents
  end
    
  def verifier_operandes(autre) #throws OperationInvalideException 
        
    if total_cents < autre.get_total_cents()
      puts "===error"
      #throw new OperationInvalideException("Opération impossible : "\
          #+ @total_cents + " - " + autre.total_cents);
    end
  end
end