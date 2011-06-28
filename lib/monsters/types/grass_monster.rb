# Generic class -- do not instantiate directly

class GrassMonster < Monster
  
  def initialize(level = 1, base_hp = 100)
    super(level, base_hp)
    
    @type         = :grass
    @weaknesses   = [:flying, :poison, :bug, :fire, :ice]
    @resistances  = [:ground, :water, :grass, :electric] 
  end
  
end