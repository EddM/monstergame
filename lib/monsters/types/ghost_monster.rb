# Generic class -- do not instantiate directly

class GhostMonster < Monster
  
  def initialize(level = 1, base_hp = 100)
    super(level, base_hp)
    
    @type         = :ghost
    @weaknesses   = [:ghost]
    @resistances  = [:poison, :bug] 
  end
  
end