class Thundershock < ElectricAttack
  
  def attack!(victim)
    damage!(victim, 100)
  end
  
end