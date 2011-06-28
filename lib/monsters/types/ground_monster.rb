# Generic class -- do not instantiate directly

class GroundMonster < Monster
  
  def initialize(level = 1, base_hp = 100)
    super(level, base_hp)
    
    @type         = :ground
    @weaknesses   = [:water, :grass, :ice]
    @resistances  = [:poison, :rock] 
  end
  
end