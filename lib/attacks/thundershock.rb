class Thundershock < ElectricAttack
  
  def attack!(victim, attacker)
    damage!(victim, attacker, 100)
  end
  
end