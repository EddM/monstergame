# Generic class -- do not instantiate directly

class RockMonster < Monster
  
  def initialize(level = 1, base_hp = 100)
    super(level, base_hp)
    
    @type         = :rock
    @weaknesses   = [:fighting, :ground, :water, :grass]
    @resistances  = [:normal, :flying, :poision, :fire] 
  end
  
end