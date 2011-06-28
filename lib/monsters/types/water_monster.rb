# Generic class -- do not instantiate directly

class WaterMonster < Monster
  
  def initialize(level = 1, base_hp = 100)
    super(level, base_hp)
    
    @type         = :water
    @weaknesses   = [:grass, :electric]
    @resistances  = [:fire, :water] 
  end
  
end