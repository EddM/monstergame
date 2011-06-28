# Generic class -- do not instantiate directly

class DragonMonster < Monster
  
  def initialize(level = 1, base_hp = 100)
    super(level, base_hp)
    
    @type         = :dragon
    @weaknesses   = [:ice, :dragon]
    @resistances  = [:fire, :water, :grass, :electric] 
  end
  
end