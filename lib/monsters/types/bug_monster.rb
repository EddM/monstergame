# Generic class -- do not instantiate directly

class BugMonster < Monster
  
  def initialize(level = 1, base_hp = 100)
    super(level, base_hp)
    
    @type         = :bug
    @weaknesses   = [:flying, :poison, :rock, :fire]
    @resistances  = [:fighting, :ground, :grass] 
  end
  
end