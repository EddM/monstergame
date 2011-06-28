# Generic class -- do not instantiate directly

class PoisonMonster < Monster
  
  def initialize(level = 1, base_hp = 100)
    super(level, base_hp)
    
    @type         = :poison
    @weaknesses   = [:ground, :bug, :psychic]
    @resistances  = [:fighting, :poison, :grass] 
  end
  
end