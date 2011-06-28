# Generic class -- do not instantiate directly

class ElectricMonster < Monster
  
  def initialize(level = 1, base_hp = 100)
    super(level, base_hp)
    
    @type         = :electric
    @weaknesses   = [:ground]
    @resistances  = [:flying, :electric] 
  end
  
end