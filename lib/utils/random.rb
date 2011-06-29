class Random
  
  def self.damage_modifier
    Kernel.rand(15)
  end
  
  def self.critical(weight)
    rand < weight
  end
  
end