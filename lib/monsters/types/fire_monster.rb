# Generic class -- do not instantiate directly

class FireMonster < Monster
  
  def initialize(level = 1, base_hp = 100)
    super(level, base_hp)
    
    @type         = :fire
    @weaknesses   = [:ground, :rock, :water]
    @resistances  = [:bug, :fire, :grass] 
  end
  
end