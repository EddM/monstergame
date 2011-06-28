# Generic class -- do not instantiate directly

class FlyingMonster < Monster
  
  def initialize(level = 1, base_hp = 100)
    super(level, base_hp)
    
    @type         = :flying
    @weaknesses   = [:rock, :electric, :ice]
    @resistances  = [:fighting, :bug, :grass] 
  end
  
end