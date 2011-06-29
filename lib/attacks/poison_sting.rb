class PoisonSting < Attack
  
  def attack!(victim, attacker)
    victim.damage!(5, :poison)
    victim.poison!
  end
  
end