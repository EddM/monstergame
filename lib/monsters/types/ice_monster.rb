# Generic class -- do not instantiate directly

class IceMonster < Monster
  
  def initialize(level = 1, base_hp = 100)
    super(level, base_hp)
    
    @type         = :ice
    @weaknesses   = [:fighting, :rock, :fire]
    @resistances  = [:ice] 
  end
  
end