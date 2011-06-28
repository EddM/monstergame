# Generic class -- do not instantiate directly

class FightingMonster < Monster
  
  def initialize(level = 1, base_hp = 100)
    super(level, base_hp)
    
    @type         = :fighting
    @weaknesses   = [:flying, :psychic]
    @resistances  = [:rock, :bug] 
  end
  
end