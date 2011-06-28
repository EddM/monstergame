# Generic class -- do not instantiate directly

class PsychicMonster < Monster
  
  def initialize(level = 1, base_hp = 100)
    super(level, base_hp)
    
    @type         = :psychic
    @weaknesses   = [:bug]
    @resistances  = [:fighting, :psychic] 
  end
  
end